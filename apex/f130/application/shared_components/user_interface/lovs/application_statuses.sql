prompt --application/shared_components/user_interface/lovs/application_statuses
begin
--   Manifest
--     APPLICATION STATUSES
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4390409470375462538)
,p_lov_name=>'APPLICATION STATUSES'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'EBA_STDS_APP_STATUSES'
,p_return_column_name=>'ID'
,p_display_column_name=>'NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'DISPLAY_SEQUENCE'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.component_end;
end;
/
