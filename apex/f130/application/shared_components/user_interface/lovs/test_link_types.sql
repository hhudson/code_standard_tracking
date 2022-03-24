prompt --application/shared_components/user_interface/lovs/test_link_types
begin
--   Manifest
--     TEST LINK TYPES
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4567674851112069280)
,p_lov_name=>'TEST LINK TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(4567674851112069280)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4567675174238069286)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Application'
,p_lov_return_value=>'APPLICATION'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4567675475874069290)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Page'
,p_lov_return_value=>'PAGE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4567675765629069290)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Region'
,p_lov_return_value=>'REGION'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4567676078609069293)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Page Item'
,p_lov_return_value=>'PAGE_ITEM'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4567676380570069293)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Application Item'
,p_lov_return_value=>'APP_ITEM'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4567676676278069293)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Button'
,p_lov_return_value=>'BUTTON'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5173514305311968456)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'List'
,p_lov_return_value=>'LIST'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5173514627768968463)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'List Entry'
,p_lov_return_value=>'LISTENTRY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2987101422672557801)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>'Database Supporting Object'
,p_lov_return_value=>'DB_SUPPORTING_OBJECT'
);
wwv_flow_api.component_end;
end;
/
