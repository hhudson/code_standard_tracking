create or replace package body eba_stds_filter2_fw as
    --------------------------------------------------------------------------------
    -- HELPER TYPE DEFINITIONS, FUNCTION AND PROCEDURE DECLARATIONS
    type lov_value_t is record (
        d varchar2(4000),
        r varchar2(4000)
    );
    type lov_values_tbl is table of lov_value_t;

    function get_lov_values( p_app_id in number, p_lov_name in varchar2 )
               return lov_values_tbl;

    procedure add_col_to_search( p_collection in varchar2, p_column in varchar2,
                                 p_exact_match in varchar2, p_case_sensitive in varchar2 );

    procedure add_lov_filter( p_collection in varchar2, p_column in varchar2,
                              p_datatype in varchar2, p_header in varchar2,
                              p_lov in varchar2, p_match_on in varchar2 );

    procedure add_numeric_filter( p_collection in varchar2, p_column in varchar2,
                                  p_header in varchar2, p_display in varchar2,
                                  p_filter in varchar2 );

    function enquote( p_name in varchar2 ) return varchar2;
    -- END HELPER DECLARATION SECTION
    --------------------------------------------------------------------------------

    --------------------------------------------------------------------------------
    -- Procedure: reset_collection
    -- Clears the collections if they exist.
    --------------------------------------------------------------------------------
    procedure reset_collection( p_collection in varchar2 ) is
    begin
        apex_collection.create_or_truncate_collection( p_collection_name => p_collection );
        apex_collection.create_or_truncate_collection( p_collection_name => p_collection||'_COL' );
    end reset_collection;

    --------------------------------------------------------------------------------
    -- Procedure: build_collection
    -- Creates and populates the collections which drive the filter search.
    -- This must be called prior to any other procedures/functions.
    -- Arguments: p_col_tbl is a table of eba_stds_filter_column_t.
    --   Must contain a record for each column in the query which is searchable,
    --   whether by text search, list of values filter, or both.
    --  p_collection is the name of the collection to be used for the page.
    --   It should be unique across the application.
    --------------------------------------------------------------------------------
    procedure build_collection( p_collection in varchar2, p_col_tbl in eba_stds_filter_col_tbl ) is
    begin
        -- Create the collections if they don't exist already.
        if not apex_collection.collection_exists( p_collection_name => p_collection ) then
            apex_collection.create_collection( p_collection_name => p_collection );
        end if;
        if not apex_collection.collection_exists( p_collection_name => p_collection||'_COL' ) then
            apex_collection.create_collection( p_collection_name => p_collection||'_COL' );
        end if;
        -- Loop through the columns passed in and process them.
        if p_col_tbl.COUNT > 0 then
            for r in p_col_tbl.FIRST..p_col_tbl.LAST loop
                -- If the column is searchable, add it to the text search collection.
                if p_col_tbl(r).in_text_search_yn = 'Y' then
                    add_col_to_search( p_collection     => p_collection||'_COL',
                                       p_column         => p_col_tbl(r).query_column,
                                       p_exact_match    => p_col_tbl(r).exact_match_yn,
                                       p_case_sensitive => p_col_tbl(r).case_sensitive_yn );
                end if;
                -- If the column is filterable, add the values to the filter collection.
                if p_col_tbl(r).lov_name is not null then
                    add_lov_filter( p_collection => p_collection,
                                    p_column     => p_col_tbl(r).query_column,
                                    p_datatype   => p_col_tbl(r).datatype,
                                    p_header     => p_col_tbl(r).header,
                                    p_lov        => p_col_tbl(r).lov_name,
                                    p_match_on   => p_col_tbl(r).match_column );
                end if;
            end loop;
        end if;
    end build_collection;

    --------------------------------------------------------------------------------
    -- Procedure: render_dropdown
    -- Emits the HTML for a menubar dropdown list of filters.
    --------------------------------------------------------------------------------
    procedure render_dropdown( p_collection in varchar2 ) is
        cursor hdr_csr is
            select header
            from (
                select c002 header, min(seq_id) s_id
                from apex_collections
                where collection_name = p_collection
                    and c001 is not null -- Ignore text searches.
                group by c002)
            order by s_id;
        hdr_rec hdr_csr%ROWTYPE;

        cursor fltr_csr( d_header in varchar2 ) is
            select seq_id,
                c003 disp,
                c010 active
            from apex_collections
            where collection_name = p_collection
                and c002 = d_header
            order by seq_id;
        fltr_rec fltr_csr%ROWTYPE;
    begin
        -- Start the dropdown.
        sys.htp.p('<div class="dropMenuContainer">');
        sys.htp.p('  <a href="javascript:void(0);" class="uButton filterMenuButton"><span>Filter <img src="'||v('IMAGE_PREFIX')||'f_spacer.gif" alt="Show Only..." class="dropDown"></span></a>');
        sys.htp.p('  <div class="menuDrop">');

        for hdr_rec in hdr_csr loop
            -- Start a new group.
            sys.htp.p('    <h4>'||apex_escape.html(hdr_rec.header)||'</h4>');
            sys.htp.p('    <ul>');

            for fltr_rec in fltr_csr( hdr_rec.header ) loop
                -- For each item in the group, create an LI tag.
                -- Note that we add the group, display, and return values to
                -- the link so that we can grab them with javascript in
                -- the dynamic actions.
                sys.htp.p('      <li><a href="#" data-group="'||apex_escape.html(hdr_rec.header)||'" '
                    ||'data-sequence="'||apex_escape.html(fltr_rec.seq_id)||'" '
                    ||'class="filterLink'
                    ||case when fltr_rec.active = 'Y' then ' active' else '' end
                    ||'"><img src="'||v('IMAGE_PREFIX')||'f_spacer.gif" alt=" "><span>'
                    ||apex_escape.html(fltr_rec.disp)||'</span></a></li>');
            end loop;
            -- Close the group.
            sys.htp.p('    </ul>');
        end loop;

        -- Finish the dropdown.
        sys.htp.p('  </div>');
        sys.htp.p('</div>');
    end render_dropdown;

    --------------------------------------------------------------------------------
    -- Procedure: render_sidebar
    -- Emits the HTML for a sidebar list of filters.
    --------------------------------------------------------------------------------
    procedure render_sidebar( p_collection in varchar2 ) is
        cursor hdr_csr is
            select header
            from (
                select c002 header, min(seq_id) s_id
                from apex_collections
                where collection_name = p_collection
                    and c001 is not null -- Ignore text searches.
                group by c002)
            order by s_id;
        hdr_rec hdr_csr%ROWTYPE;

        cursor fltr_csr( d_header in varchar2 ) is
            select seq_id,
                c003 disp,
                c010 active
            from apex_collections
            where collection_name = p_collection
                and c002 = d_header
            order by seq_id;
        fltr_rec fltr_csr%ROWTYPE;

        l_grp  number := 0;
    begin
        for hdr_rec in hdr_csr loop
            -- Start a new group.
            sys.htp.p('<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked">');
 
            sys.htp.p('<div class="t-Form-labelContainer">');
            sys.htp.p('<label for="P_FILTER_'||l_grp||'" id="P_FILTER_'||l_grp||'_LABEL" '
                ||'class="t-Form-label">'||apex_escape.html(hdr_rec.header)||'</label>');
            sys.htp.p('</div>');
            sys.htp.p('  <div class="t-Form-inputContainer">');
            sys.htp.p('    <fieldset tabindex="-1" id="P_FILTER_'||l_grp||'" '
                ||'aria-labelledby="P_FILTER_'||l_grp||'_LABEL" class="checkbox_group">');

            for fltr_rec in fltr_csr( hdr_rec.header ) loop
                -- For each item in the group, create an LI tag.
                -- Note that we add the group, display, and return values to
                -- the link so that we can grab them with javascript in
                -- the dynamic actions.
                sys.htp.p('<input class="filterLink" type="checkbox" id="P_FILTER_'||l_grp||'_'
                    ||apex_escape.html(fltr_rec.seq_id)||'" '
                    ||'data-group="'||apex_escape.html(hdr_rec.header)||'" '
                    ||'data-sequence="'||apex_escape.html(fltr_rec.seq_id)||'"'
                    ||case when fltr_rec.active = 'Y' then ' checked ' else '' end
                    ||'value="'||apex_escape.html(fltr_rec.seq_id)||'">');
                sys.htp.p('<label for="P_FILTER_'||l_grp||'_'
                    ||apex_escape.html(fltr_rec.seq_id)||'">'
                    ||apex_escape.html(fltr_rec.disp)
                    ||'</label><br>');
            end loop;
            -- Close the group.
            sys.htp.p('    </fieldset>');
            sys.htp.p('  </div>');
            sys.htp.p('</div>');
        end loop;
    end render_sidebar;

    --------------------------------------------------------------------------------
    -- Function: get_filter
    -- Returns the active state of the specified filter.
    --------------------------------------------------------------------------------
    function get_filter( p_collection in varchar2, p_seq_id in number ) return varchar2 is
    begin
        for c in (  select c010 ret
                    from apex_collections
                    where collection_name = p_collection
                        and seq_id = p_seq_id ) loop
            return c.ret;
        end loop;

        -- In case the entry doesn't exist in the collection, return null.
        -- Should never happen.
        return null;
    end get_filter;

    --------------------------------------------------------------------------------
    -- Procedure: set_filter
    -- Sets the active state of the specified filter.
    --------------------------------------------------------------------------------
    procedure set_filter( p_collection in varchar2,
                          p_seq_id in number,
                          p_active in varchar2 ) is
        l_cnt number;
    begin
        if p_active = 'N' then
            select count(*) into l_cnt
            from apex_collections
            where collection_name = p_collection
                and seq_id = p_seq_id
                and c001 is null;

            if l_cnt > 0 then
                -- Text search to be removed.
                apex_collection.delete_member( p_collection_name => p_collection,
                                               p_seq             => p_seq_id );
                return;
            end if;
        end if;

        apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                 p_seq => p_seq_id,
                                                 p_attr_number => 10,
                                                 p_attr_value => p_active );
    end set_filter;

    --------------------------------------------------------------------------------
    -- Procedure: set_filter
    -- Alternate entry point to set based on the column & display value.
    --------------------------------------------------------------------------------
    procedure set_filter( p_collection in varchar2,
                          p_column in varchar2,
                          p_dispval in varchar2,
                          p_active in varchar2 ) is
        cursor seq_csr is
            select seq_id
            from apex_collections
            where collection_name = p_collection
                and c001 = p_column
                and (c003 = p_dispval or apex_escape.html(c003) = p_dispval);
        seq_rec seq_csr%ROWTYPE;
    begin
        for seq_rec in seq_csr loop
            set_filter( p_collection => p_collection, p_seq_id => seq_rec.seq_id, p_active => p_active );
        end loop;
    end set_filter;

    --------------------------------------------------------------------------------
    -- Procedure: add_text_search
    -- Adds a search string to the text search filters.
    --------------------------------------------------------------------------------
    procedure add_text_search( p_collection in varchar2, p_text_group in varchar2,
                               p_search_str in varchar2, p_multiple in boolean ) is
        l_x number := 0;
    begin
        -- Text searches are stored similar to filters, but we don't need to
        -- associate them with columns in the query or worry about the display/return
        -- value match flag. For simplicity, we do store the search string in
        -- both the display and return value fields, however.
        if p_multiple then
            select count(*) into l_x
            from apex_collections
            where collection_name = p_collection
                and c006 = 'TEXTSEARCH'
                and c003 = p_search_str;

            -- If the string matches what's already searched, no need to add it again.
            if l_x = 0 then
                apex_collection.add_member( p_collection_name => p_collection,
                                            p_c002 => p_text_group,
                                            p_c003 => p_search_str,
                                            p_c004 => p_search_str,
                                            p_c006 => 'TEXTSEARCH',
                                            p_c010 => 'Y' );
            end if;
        else
            begin
                select seq_id into l_x
                from apex_collections
                where collection_name = p_collection
                    and c006 = 'TEXTSEARCH';

                -- If there's already a search string, replace it.
                apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                         p_seq => l_x,
                                                         p_attr_number => 3,
                                                         p_attr_value => p_search_str );
                apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                         p_seq => l_x,
                                                         p_attr_number => 4,
                                                         p_attr_value => p_search_str );
            exception
                when NO_DATA_FOUND then
                    -- New text search.
                    apex_collection.add_member( p_collection_name => p_collection,
                                                p_c002 => p_text_group,
                                                p_c003 => p_search_str,
                                                p_c004 => p_search_str,
                                                p_c006 => 'TEXTSEARCH',
                                                p_c010 => 'Y' );
            end;
        end if;
    end;

    --------------------------------------------------------------------------------
    -- Function: get_active_filters
    -- Pipelined function to return the active filters. This enables us to "hide"
    -- the collection name.
    --------------------------------------------------------------------------------
    function get_active_filters( p_collection in varchar2 )
            return active_filters_tbl PIPELINED is
        cursor fltr_csr is
            select seq_id filter_sequence,
                c002 filter_group,
                c003 filter_display,
                nvl(to_char(d001),nvl(to_char(n001),c004)) filter_value,
                n001 numeric_value,
                n002 min_num_value,
                n003 max_num_value,
                c015 min_boundary,
                c016 max_boundary,
                d001 date_value,
                last_value(c002) over (order by seq_id rows between unbounded preceding and 1 preceding) active_group,
                c005 match_col
            from apex_collections
            where collection_name = p_collection
                and c010 = 'Y'
            order by seq_id;
        fltr_rec fltr_csr%ROWTYPE;
    begin
        for fltr_rec in fltr_csr loop
            PIPE ROW (fltr_rec);
        end loop;
    end get_active_filters;

    --------------------------------------------------------------------------------
    -- Function: apply_active_filters
    -- Modifies the user's query to include the selected filters.
    -- Usable in classic reports, tabular forms, and other places which allow
    -- for a function returning SQL query.
    --------------------------------------------------------------------------------
    function apply_active_filters( p_collection in varchar2, p_query in clob )
            return clob is
        l_with  clob;
        l_from  clob;
        l_where clob;
        t number := 0;
        d number := 0;

        -- The list of groups with active filter(s). These use 'AND' behavior.
        -- Note that we protect ourselves from having quotes in the group name.
        cursor grp_csr is
            select replace(g.grp,'''','''''') grp, g.col, g.group_type
            from (
                select ac.c002 grp, ac.c001 col, ac.c006 group_type
                from apex_collections ac
                where ac.collection_name = p_collection
                    and ac.c010 = 'Y'
                    and ac.c006 != 'TEXTSEARCH'
                group by ac.c002, ac.c001, ac.c006 ) g;
        grp_rec grp_csr%ROWTYPE;

        -- The active text search string(s). We want 'AND' behavior for these.
        cursor text_csr is
            select seq_id
            from apex_collections
            where collection_name = p_collection
                and c006 = 'TEXTSEARCH';
        text_rec text_csr%ROWTYPE;
        -- The columns used in text searches.
        cursor tscol_csr is
            select c001 col,
                c002 exact,
                c003 case_sensitive
            from apex_collections
            where collection_name = p_collection||'_COL';
        ts_rec tscol_csr%ROWTYPE;
    begin
        l_from := ' select src.* from ('||p_query||') src';
        -- First, apply any active LOV filters.
        for grp_rec in grp_csr loop
            -- The first filter creates the where clause; the others add ANDs.
            if l_where is null then
                l_with := 'with af as ( select /*+ INLINE */ c002 gp, '
                        ||'decode(c005,''D'',c003,c004) m, n001 n, '
                        ||'n002 minv, n003 maxv, c015 inc_min, c016 inc_max, d001 d '
                        ||'from apex_collections where collection_name = '''
                        ||replace(p_collection,'''','''''')||''' '
                        ||'and c001 is not null and c010 = ''Y'' )';
                l_where := ' where ';
            else
                l_where := l_where || ' and ';
            end if;
            -- Create an IN clause for the filter group.
            if grp_rec.group_type = 'NUMBER' then
                -- For numeric columns, check against the numeric value.
                l_where := l_where || 'src.'||enquote(grp_rec.col) || ' in (';
                l_where := l_where||'select af.n from af where af.gp = '''||grp_rec.grp||'''';
                l_where := l_where || ')';
            elsif grp_rec.group_type = 'NUMBER_RANGE' then
                -- For numeric range columns, need to use exists.
                l_where := l_where || 'exists ( select null from af '
                        ||'where af.gp = '''||grp_rec.grp||''' '
                        ||'and (af.minv is null '
                        ||'or ( af.inc_min = ''Y'' and af.minv <= src.'||enquote(grp_rec.col)||') '
                        ||'or ( af.inc_min = ''N'' and af.minv < src.'||enquote(grp_rec.col)||')) '
                        ||'and (af.maxv is null '
                        ||'or ( af.inc_max = ''Y'' and af.maxv >= src.'||enquote(grp_rec.col)||') '
                        ||'or ( af.inc_max = ''N'' and af.maxv > src.'||enquote(grp_rec.col)||')))';
            elsif grp_rec.group_type = 'DATE' then
                -- For date columns, check against the date value.
                l_where := l_where || 'src.'||enquote(grp_rec.col) || ' in (';
                l_where := l_where||'select af.d from af where af.gp = '''||grp_rec.grp||'''';
                l_where := l_where || ')';
            else
                l_where := l_where || 'src.'||enquote(grp_rec.col) || ' in (';
                l_where := l_where||'select af.m from af where af.gp = '''||grp_rec.grp||'''';
                l_where := l_where || ')';
            end if;
        end loop;

        -- Now, apply the text search filters. Applying them after the LOV filters
        -- should allow for better optimization paths.
        for text_rec in text_csr loop
            -- Declare a new view for this particular text filter.
            t := t+1;
            if l_with is null then
                l_with := 'with ';
            else
                l_with := l_with||', ';
            end if;
            l_with := l_with||'tf'||t||' as ( select /*+ INLINE */ c003 m, upper(c003) um from apex_collections '
                                    ||'where collection_name = '''
                                    ||replace(p_collection,'''','''''')||''' and '
                                    ||'seq_id = '||text_rec.seq_id||' )';

            l_from := l_from||', tf'||t;
            -- The first filter (may not have been any LOV filters) creates the where clause; the others add ANDs.
            if l_where is null then
                l_where := l_where || ' where ';
            else
                l_where := l_where || ' and ';
            end if;

            l_where := l_where||'(';
            d := 0;
            for ts_rec in tscol_csr loop
                d := d+1;
                -- Every column checked after the first needs to be ORed in.
                if d > 1 then l_where := l_where ||'or '; end if;
                -- Now, build the condition.
                if ts_rec.exact = 'Y' and ts_rec.case_sensitive = 'Y' then
                    -- Exact, case-sensitive match.
                    l_where := l_where||'src.'||enquote(ts_rec.col)||' = tf'||t||'.m ';
                elsif ts_rec.exact = 'Y' and ts_rec.case_sensitive = 'N' then
                    -- Exact, case-insensitive match.
                    l_where := l_where||'upper(src.'||enquote(ts_rec.col)||')'||' = tf'||t||'.um ';
                elsif ts_rec.exact = 'N' and ts_rec.case_sensitive = 'Y' then
                    -- LIKE search, case-sensitive.
                    l_where := l_where||'src.'||enquote(ts_rec.col)||' like ''%''||tf'||t||'.m||''%'' ';
                elsif ts_rec.exact = 'N' and ts_rec.case_sensitive = 'N' then
                    -- LIKE search, case-insensitive.
                    l_where := l_where||'upper(src.'||enquote(ts_rec.col)||')'||' like ''%''||tf'||t||'.um||''%'' ';
                end if;
            end loop;
            l_where := l_where||')';
        end loop;
        return l_with||l_from||l_where;
    end apply_active_filters;

    --------------------------------------------------------------------------------
    -- HELPER FUNCTION AND PROCEDURE DEFINITIONS
    --------------------------------------------------------------------------------
    -- Function: get_lov_values
    -- Parses a list of values, returning the display and return values.
    -- Note that this does not support any APEX conditionality; authorizations,
    --   build options, and conditions are ignored. Sorry.
    --------------------------------------------------------------------------------
    function get_lov_values( p_app_id in number, p_lov_name in varchar2 )
            return lov_values_tbl is
        l_val lov_value_t;
        l_ret lov_values_tbl := lov_values_tbl();
        cursor lov_csr is
            select lov_type,
                list_of_values_query,
                lov_id
            from apex_application_lovs
            where application_id = p_app_id
                and list_of_values_name = p_lov_name;
        lov_rec lov_csr%ROWTYPE;
        type csr_t is ref cursor;
        dlov_csr csr_t;
    begin
        -- Although the query returns a single row, let PL/SQL handle the cursor.
        for lov_rec in lov_csr loop
            if lov_rec.lov_type = 'Static' then
                -- Static LOVs hold the display and return values in the data dictionary.
                for c1 in (
                        select display_value d, return_value r
                        from apex_application_lov_entries
                        where application_id = p_app_id
                            and lov_id = lov_rec.lov_id
                        order by display_sequence ) loop
                    l_ret.extend;
                    l_ret(l_ret.COUNT).d := c1.d;
                    l_ret(l_ret.COUNT).r := c1.r;
                end loop;
            else
                -- To get the display and return values of dynamic LOVs, we need
                -- to use a weakly-bound cursor.
                open dlov_csr for sys.dbms_assert.noop(lov_rec.list_of_values_query);
                loop
                    fetch dlov_csr into l_val;
                    exit when dlov_csr%NOTFOUND;
                    l_ret.extend;
                    l_ret(l_ret.COUNT) := l_val;
                end loop;
            end if;
        end loop;
        return l_ret;
    end get_lov_values;

    --------------------------------------------------------------------------------
    -- Procedure: add_col_to_search
    -- Adds a column to the text search collection if it isn't already there. If it
    -- is, updates the exact match/case sensitivity columns, just in case.
    --------------------------------------------------------------------------------
    procedure add_col_to_search( p_collection in varchar2, p_column in varchar2,
                                 p_exact_match in varchar2, p_case_sensitive in varchar2 ) is
        l_seq number;
        l_match varchar2(1);
        l_case varchar2(1);
    begin
        -- Collections don't have boolean columns. Convert to varchar2(1).
        if p_exact_match = 'Y' then l_match := 'Y'; else l_match := 'N'; end if;
        if p_case_sensitive = 'Y' then l_case := 'Y'; else l_case := 'N'; end if;

        begin
            select seq_id into l_seq
            from apex_collections
            where collection_name = p_collection
                and c001 = p_column;

            apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                     p_seq => l_seq,
                                                     p_attr_number => 2,
                                                     p_attr_value => l_match );
            apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                     p_seq => l_seq,
                                                     p_attr_number => 3,
                                                     p_attr_value => l_case );
        exception
            when NO_DATA_FOUND then
                -- Column not found in the collection; add it.
                apex_collection.add_member( p_collection_name => p_collection,
                                            p_c001 => p_column,
                                            p_c002 => l_match,
                                            p_c003 => l_case );
        end;
    end add_col_to_search;

    --------------------------------------------------------------------------------
    -- Procedure: add_lov_filter
    -- Adds a filter's values to the collection if they don't already exist.
    --------------------------------------------------------------------------------
    procedure add_lov_filter( p_collection in varchar2, p_column in varchar2,
                              p_datatype in varchar2, p_header in varchar2,
                              p_lov in varchar2, p_match_on in varchar2 ) is
        l_cnt number;
        l_lov_vals lov_values_tbl;
    begin
        -- Get the display and return values for the LOV and loop through them.
        l_lov_vals := get_lov_values( p_app_id => v('APP_ID'), p_lov_name => p_lov );
        if l_lov_vals.COUNT > 0 then
            for vl in l_lov_vals.FIRST..l_lov_vals.LAST loop
                select count(*) into l_cnt
                from apex_collections
                where collection_name = p_collection
                    and c001 = p_column
                    and c002 = p_header
                    and c003 = l_lov_vals(vl).d;

                if l_cnt = 0 then
                    -- Value not found in the collection; add it.
                    if p_datatype in ('NUMBER', 'BINARY_FLOAT', 'BINARY_DOUBLE') then
                        add_numeric_filter( p_collection => p_collection,
                                            p_column => p_column,
                                            p_header => p_header,
                                            p_display => l_lov_vals(vl).d,
                                            p_filter => l_lov_vals(vl).r );
                    elsif p_datatype in ('DATE', 'TIMESTAMP',
                                'TIMESTAMP WITH TIME ZONE',
                                'TIMESTAMP WITH LOCAL TIME ZONE') then
                        apex_collection.add_member( p_collection_name => p_collection,
                                                    p_c001 => p_column,
                                                    p_c002 => p_header,
                                                    p_c003 => l_lov_vals(vl).d,
                                                    p_c006 => 'DATE',
                                                    p_d001 => to_date(l_lov_vals(vl).r),
                                                    p_c005 => p_match_on,
                                                    p_c010 => 'N' );
                    else
                        apex_collection.add_member( p_collection_name => p_collection,
                                                    p_c001 => p_column,
                                                    p_c002 => p_header,
                                                    p_c003 => l_lov_vals(vl).d,
                                                    p_c004 => l_lov_vals(vl).r,
                                                    p_c005 => p_match_on,
                                                    p_c006 => 'VARCHAR',
                                                    p_c010 => 'N' );
                    end if;
                end if;
            end loop;
        end if;
    end add_lov_filter;

    --------------------------------------------------------------------------------
    -- Procedure: add_numeric_filter
    -- Handles adding a numeric filter (exact match or range) to the collection.
    --------------------------------------------------------------------------------
    procedure add_numeric_filter( p_collection in varchar2, p_column in varchar2,
                                  p_header in varchar2, p_display in varchar2,
                                  p_filter in varchar2 ) is
        cursor ftr_csr is
            select decode(substr(p_filter,1,1),'[','Y','N') inc_min,
                decode(substr(p_filter,-1,1),']','Y','N') inc_max,
                to_number(substr(p_filter,2,instr(p_filter,',')-2)) min,
                to_number(substr(p_filter,instr(p_filter,',')+1,length(p_filter)-(instr(p_filter,',')+1))) max
            from dual;
        ftr_rec ftr_csr%ROWTYPE;
    begin
        if substr( p_filter, 1, 1 ) in ('(','[') then
            -- Range filter. Format is: open interval-minimum-comma-maximum-close interval,
            -- where the open and close intervals are either parentheses ()
            -- or brackets []; parentheses show non-inclusive range (up to but not including),
            -- while brackets indicate inclusive (up to and including).
            -- If minimum or maximum are not specified, then the range is unbounded.
            -- Examples:
            --   Less than 10: (,10)
            --   Any number from 1 to 5, but not including 5: [1,5)
            --   100 or more: [100,]
            for ftr_rec in ftr_csr loop
                -- Single-row loop.
                apex_collection.add_member( p_collection_name => p_collection,
                                            p_c001 => p_column,
                                            p_c002 => p_header,
                                            p_c003 => p_display,
                                            p_c006 => 'NUMBER_RANGE',
                                            p_n002 => ftr_rec.min,
                                            p_n003 => ftr_rec.max,
                                            p_c015 => ftr_rec.inc_min,
                                            p_c016 => ftr_rec.inc_max,
                                            p_c010 => 'N' );
            end loop;
        else
            -- Single number filter.
            apex_collection.add_member( p_collection_name => p_collection,
                                        p_c001 => p_column,
                                        p_c002 => p_header,
                                        p_c003 => p_display,
                                        p_c006 => 'NUMBER',
                                        p_n001 => to_number(p_filter),
                                        p_c010 => 'N' );
        end if;
    end add_numeric_filter;

    --------------------------------------------------------------------------------
    -- Function: enquote
    -- Wrapper around sys.dbms_assert_enquote_name to reduce typing.
    --------------------------------------------------------------------------------
    function enquote( p_name in varchar2 ) return varchar2 is
    begin
        return sys.dbms_assert.enquote_name( str => p_name, capitalize => true );
    end enquote;

end eba_stds_filter2_fw;
/