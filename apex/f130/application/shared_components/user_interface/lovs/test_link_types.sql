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
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4548831122575101528)
,p_lov_name=>'TEST LINK TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(4548831122575101528)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4548831445701101534)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Application'
,p_lov_return_value=>'APPLICATION'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4548831747337101538)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Page'
,p_lov_return_value=>'PAGE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4548832037092101538)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Region'
,p_lov_return_value=>'REGION'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4548832350072101541)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Page Item'
,p_lov_return_value=>'PAGE_ITEM'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4548832652033101541)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Application Item'
,p_lov_return_value=>'APP_ITEM'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4548832947741101541)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Button'
,p_lov_return_value=>'BUTTON'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5154670576775000704)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'List'
,p_lov_return_value=>'LIST'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5154670899232000711)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'List Entry'
,p_lov_return_value=>'LISTENTRY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2968257694135590049)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>'Database Supporting Object'
,p_lov_return_value=>'DB_SUPPORTING_OBJECT'
);
wwv_flow_api.component_end;
end;
/
