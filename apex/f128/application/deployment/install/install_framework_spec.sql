prompt --application/deployment/install/install_framework_spec
begin
--   Manifest
--     INSTALL: INSTALL-framework Spec
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(5169656769295172054)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'framework Spec'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace',
'package eba_stds_fw as',
'',
'    function conv_txt_html (',
'        p_txt_message in varchar2 )',
'        return varchar2;',
'',
'    function conv_urls_links (',
'        p_string in varchar2 )',
'        return varchar2;',
'',
'    function format_status_update (',
'        p_string in clob,',
'        p_shorten_url in varchar2 default ''N'' )',
'        return varchar2;',
'',
'    function tags_cleaner (',
'        p_tags  in varchar2,',
'        p_case  in varchar2 default ''U'' )',
'        return varchar2;',
'',
'    procedure tag_sync (',
'        p_new_tags          in varchar2,',
'        p_old_tags          in varchar2,',
'        p_content_type      in varchar2,',
'        p_content_id        in number );',
'',
'    function get_preference_value (',
'        p_preference_name in varchar2 )',
'        return varchar2;',
'',
'    procedure set_preference_value (',
'        p_preference_name  in varchar2, ',
'        p_preference_value in varchar2 );',
'',
'    function compress_int (',
'        n in integer )',
'        return varchar2;',
'',
'    function apex_error_handling (',
'        p_error in apex_error.t_error )',
'        return apex_error.t_error_result;',
'',
'end eba_stds_fw;',
'/',
'show errors'))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(2084884284355629515)
,p_script_id=>wwv_flow_api.id(5169656769295172054)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_STDS_FW'
,p_last_updated_on=>to_date('20141219062052','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062052','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
