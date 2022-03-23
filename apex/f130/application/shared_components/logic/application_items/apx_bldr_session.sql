prompt --application/shared_components/logic/application_items/apx_bldr_session
begin
--   Manifest
--     APPLICATION ITEM: APX_BLDR_SESSION
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2953977059365452042
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(4532796227282347667)
,p_name=>'APX_BLDR_SESSION'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_required_patch=>wwv_flow_api.id(4531216635900802711)
);
wwv_flow_api.component_end;
end;
/
