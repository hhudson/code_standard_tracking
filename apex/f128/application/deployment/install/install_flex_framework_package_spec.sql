prompt --application/deployment/install/install_flex_framework_package_spec
begin
--   Manifest
--     INSTALL: INSTALL-Flex Framework package spec
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
 p_id=>wwv_flow_api.id(1688832324360489287)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Flex Framework package spec'
,p_sequence=>310
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_stds_flex_fw as',
'',
'    procedure flex_report_update (',
'        p_flex_table_name    in varchar2,',
'        p_irr_region_id      in number,',
'        p_flex_column_prefix in varchar2,',
'        p_app_id             in number,',
'        p_page_id            in number,',
'        p_region_type        in varchar2',
'    );',
'',
'    function validate_lov_query ( p_query in varchar2,',
'        p_display_column out varchar2,',
'        p_return_column out varchar2,',
'        p_error out varchar2',
'    ) return boolean;',
'',
'    procedure populate_page_map_table;',
'',
'    procedure reset_flex_registry;',
'',
'    function fetch_v( p_column in varchar2,',
'                      p_input in varchar2 ) return varchar2;',
'',
'    function fetch_n( p_column in varchar2,',
'                      p_input in number ) return varchar2;',
'',
'end eba_stds_flex_fw;',
'/',
'show errors',
''))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(2084907750592631077)
,p_script_id=>wwv_flow_api.id(1688832324360489287)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_STDS_FLEX_FW'
,p_last_updated_on=>to_date('20141219062107','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062107','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
