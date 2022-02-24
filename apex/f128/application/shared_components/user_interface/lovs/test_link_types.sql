prompt --application/shared_components/user_interface/lovs/test_link_types
begin
--   Manifest
--     TEST LINK TYPES
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
 p_id=>wwv_flow_api.id(1998562715900483307)
,p_lov_name=>'TEST LINK TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(1998562715900483307)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1998563039026483313)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Application'
,p_lov_return_value=>'APPLICATION'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1998563340662483317)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Page'
,p_lov_return_value=>'PAGE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1998563630417483317)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Region'
,p_lov_return_value=>'REGION'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1998563943397483320)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Page Item'
,p_lov_return_value=>'PAGE_ITEM'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1998564245358483320)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Application Item'
,p_lov_return_value=>'APP_ITEM'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1998564541066483320)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Button'
,p_lov_return_value=>'BUTTON'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2604402170100382483)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'List'
,p_lov_return_value=>'LIST'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2604402492557382490)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'List Entry'
,p_lov_return_value=>'LISTENTRY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(17323250005135179)
,p_lov_disp_sequence=>18
,p_lov_disp_value=>'Source Code'
,p_lov_return_value=>'SOURCE_CODE'
);
wwv_flow_api.component_end;
end;
/
