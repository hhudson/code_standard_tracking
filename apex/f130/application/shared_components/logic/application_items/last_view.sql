prompt --application/shared_components/logic/application_items/last_view
begin
--   Manifest
--     APPLICATION ITEM: LAST_VIEW
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2916431860810340515
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(8774410408243357217)
,p_name=>'LAST_VIEW'
,p_protection_level=>'S'
,p_escape_on_http_output=>'N'
);
wwv_flow_api.component_end;
end;
/
