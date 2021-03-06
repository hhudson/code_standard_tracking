prompt --application/shared_components/user_interface/lovs/standards
begin
--   Manifest
--     STANDARDS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4428255977291607493)
,p_lov_name=>'STANDARDS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from eba_stds_standards'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
wwv_flow_api.component_end;
end;
/
