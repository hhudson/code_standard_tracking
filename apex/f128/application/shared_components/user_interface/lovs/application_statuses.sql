prompt --application/shared_components/user_interface/lovs/application_statuses
begin
--   Manifest
--     APPLICATION STATUSES
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1840141063700844317)
,p_lov_name=>'APPLICATION STATUSES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_escape.html(name) d, id r',
'from eba_stds_app_statuses',
'order by display_sequence, name'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
wwv_flow_api.component_end;
end;
/
