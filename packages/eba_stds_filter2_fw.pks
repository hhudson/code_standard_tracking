create or replace package eba_stds_filter2_fw as
    -- Procedure: reset_collection
    -- Clears the collections if they exist.
    procedure reset_collection( p_collection in varchar2
                                    default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID') );

    -- Procedure: build_collection
    -- Creates and populates the collections which drive the filter search.
    -- This must be called prior to any other procedures/functions.
    -- Arguments: p_col_tbl is a table of eba_stds_filter_column_t.
    --   Must contain a record for each column in the query which is searchable,
    --   whether by text search, list of values filter, or both.
    --  p_collection is the name of the collection to be used for the page.
    --   It should be unique across the application.
    procedure build_collection( p_collection in varchar2
                                    default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                                p_col_tbl in eba_stds_filter_col_tbl
                                   );

    -- Procedure: render_dropdown
    -- Emits the HTML for a menubar dropdown list of filters.
    procedure render_dropdown( p_collection in varchar2
                                   default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID') );
    -- Procedure: render_sidebar
    -- Emits the HTML for a sidebar list of filters.
    procedure render_sidebar( p_collection in varchar2
                                  default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID') );

    -- Function: get_filter
    -- Returns the active state of the specified filter.
    function get_filter( p_collection in varchar2
                             default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                         p_seq_id in number ) return varchar2;

    -- Procedure: set_filter
    -- Sets the active state of the specified filter.
    procedure set_filter( p_collection in varchar2
                              default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                          p_seq_id in number,
                          p_active in varchar2 );

    -- Procedure: set_filter
    -- Alternate entry point to set based on the column & display value.
    procedure set_filter( p_collection in varchar2
                              default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                          p_column in varchar2 default null,
                          p_dispval in varchar2,
                          p_active in varchar2 );

    -- Function: get_active_filters
    -- Pipelined function to return the active filters. This enables us to "hide"
    -- the collection name.
    type active_filters_t is record (
        filter_sequence number,
        filter_group    varchar2(4000),
        filter_display  varchar2(4000),
        filter_value    varchar2(4000),
        numeric_value   number,
        min_num_value   number,
        max_num_value   number,
        min_boundary    varchar2(2),
        max_boundary    varchar2(2),
        date_value      date,
        active_group    varchar2(4000),
        match_col       varchar2(1)
    );
    type active_filters_tbl is table of active_filters_t;
    function get_active_filters( p_collection in varchar2
                                     default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID') )
        return active_filters_tbl PIPELINED;

    -- Procedure: add_text_search
    -- Adds a search string to the text search filters.
    procedure add_text_search( p_collection in varchar2
                                   default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                               p_text_group in varchar2 default 'Report Row Contains',
                               p_search_str in varchar2,
                               p_multiple   in boolean default true );

    -- Function: apply_active_filters
    -- Modifies the user's query to include the selected filters.
    -- Usable in classic reports, tabular forms, and other places which allow
    -- for a function returning SQL query.
    function apply_active_filters( p_collection in varchar2
                                       default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                                   p_query in clob
        ) return clob;

end eba_stds_filter2_fw;
/