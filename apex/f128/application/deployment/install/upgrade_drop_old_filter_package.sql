prompt --application/deployment/install/upgrade_drop_old_filter_package
begin
--   Manifest
--     INSTALL: UPGRADE-Drop old filter package
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
 p_id=>wwv_flow_api.id(578956792273864252)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Drop old filter package'
,p_sequence=>108
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_objects',
'where upper(object_type) = ''PACKAGE''',
'    and object_name = ''EBA_STDS_FILTER_FW'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in ( select object_name',
'                from user_objects',
'                where upper(object_type) = ''PACKAGE''',
'                    and object_name = ''EBA_STDS_FILTER_FW'' ) loop',
'        execute immediate ''drop package ''||c1.object_name;',
'    end loop;',
'exception',
'    -- Hide the error if the package cannot be dropped due to bug #21770724',
'    when others then null;',
'end;',
'/',
''))
);
wwv_flow_api.component_end;
end;
/
