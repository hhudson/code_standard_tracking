prompt --application/deployment/install/install_eba_stds_security_spec
begin
--   Manifest
--     INSTALL: INSTALL-eba_stds_security spec
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(2556895236285184966)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'eba_stds_security spec'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_stds_security is',
'    -------------------------------------------------------------------------',
'    -- Gets the current user''s authorization level. Can depend on the following:',
'    --  * If access control is currently disabled, returns highest level of 3.',
'    --  * If access control is enabled, but user is not in list, returns 0',
'    --  * If access control is enabled and user is in list, returns their',
'    --    access level.',
'    -------------------------------------------------------------------------',
'    function get_authorization_level (',
'        p_username             varchar2)',
'        return number;',
'',
'    -------------------------------------------------------------------------',
'    -- Check the application''s logic to see if the user is allowed to',
'    -- view the data on a page. Used for finer control than the normal ACL.',
'    -------------------------------------------------------------------------',
'    function is_authorized_viewer( p_user in varchar2) return varchar2;',
'',
'end eba_stds_security;',
'/',
'show errors'))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(2084884194366629505)
,p_script_id=>wwv_flow_api.id(2556895236285184966)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_STDS_SECURITY'
,p_last_updated_on=>to_date('20141219062052','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062052','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
