prompt --application/shared_components/user_interface/lovs/standard_tracker_views
begin
--   Manifest
--     STANDARD TRACKER VIEWS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(2937086483673380393)
,p_lov_name=>'STANDARD TRACKER VIEWS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select view_name d, view_name r',
'from user_views',
'--where view_name in (select table_name',
'--                    from all_tab_cols',
'--                    where column_name = ''REFERENCE_CODE'')',
'order by view_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'APEX_200100'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.component_end;
end;
/
