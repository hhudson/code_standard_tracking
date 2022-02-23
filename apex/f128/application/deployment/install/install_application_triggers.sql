prompt --application/deployment/install/install_application_triggers
begin
--   Manifest
--     INSTALL: INSTALL-Application Triggers
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
 p_id=>wwv_flow_api.id(2529825340942284645)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Application Triggers'
,p_sequence=>150
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger eba_stds_types_biu',
'    before insert or update on eba_stds_types',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'end;',
'/',
'show errors',
'',
'alter trigger eba_stds_types_biu enable;',
'',
'create or replace trigger eba_stds_app_statuses_biu',
'    before insert or update on eba_stds_app_statuses',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'end;',
'/',
'show errors',
'',
'alter trigger eba_stds_app_statuses_biu enable;',
'',
'create or replace trigger eba_stds_standard_statuses_biu',
'    before insert or update on eba_stds_standard_statuses',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'end;',
'/',
'show errors',
'',
'alter trigger eba_stds_standard_statuses_biu enable;',
'',
'create or replace trigger eba_stds_applications_biu',
'    before insert or update on eba_stds_applications',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if :new.row_key is null then',
'        declare',
'            l_next_seq_val number;',
'        begin',
'           select eba_stds_seq.nextval into l_next_seq_val from dual;',
'           :new.row_key := eba_stds_fw.compress_int(l_next_seq_val);',
'        end;',
'    end if;',
'    if :new.tags is not null then',
'        :new.tags := eba_stds_fw.tags_cleaner( :new.tags );',
'    end if;',
'    if inserting then',
'        :new.created    := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    :new.updated    := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'    eba_stds_fw.tag_sync(',
'        p_new_tags      => :new.tags,',
'        p_old_tags      => :old.tags,',
'        p_content_type  => ''APPLICATION'',',
'        p_content_id    => :new.id );',
'end;',
'/',
'show errors',
'',
'alter trigger eba_stds_applications_biu enable;',
'',
'create or replace trigger eba_stds_applications_bd',
'    before delete on eba_stds_applications',
'    for each row',
'begin',
'    eba_stds_fw.tag_sync(',
'        p_new_tags      => null,',
'        p_old_tags      => :old.tags,',
'        p_content_type  => ''APPLICATION'',',
'        p_content_id    => :old.id );',
'end;',
'/',
'',
'alter trigger eba_stds_applications_bd enable;',
'',
'create or replace trigger eba_stds_notes_biu',
'    before insert or update on eba_stds_notes',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if inserting then',
'        :new.created    := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    :new.updated    := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'end;',
'/',
'',
'alter trigger eba_stds_notes_biu enable;',
'',
'create or replace trigger eba_stds_standards_biu',
'    before insert or update on eba_stds_standards',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if inserting then',
'        :new.created    := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'    end if;',
'    :new.updated    := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'end;',
'/',
'',
'alter trigger eba_stds_standards_biu enable;',
'',
'create or replace trigger eba_stds_standard_tests_biu',
'    before insert or update on eba_stds_standard_tests',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if inserting then',
'        :new.created    := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'    end if;',
'    :new.updated    := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'end;',
'/',
'',
'alter trigger eba_stds_standard_tests_biu enable;',
'',
'create or replace trigger eba_stds_standard_app_ref_biu',
'    before insert or update on eba_stds_standard_app_ref',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'end;',
'/',
'',
'alter trigger eba_stds_standard_app_ref_biu enable;',
'',
'create or replace trigger eba_stds_standard_type_ref_biu',
'    before insert or update on eba_stds_standard_type_ref',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'end;',
'/',
'',
'alter trigger eba_stds_standard_type_ref_biu enable;',
'',
'create or replace trigger eba_stds_standard_statuses_biu',
'    before insert or update on eba_stds_standard_statuses',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    :new.updated := localtimestamp;',
'end;',
'/',
'',
'alter trigger eba_stds_standard_statuses_biu enable;',
'',
'create or replace trigger eba_stds_test_validations_biu',
'    before insert or update on eba_stds_test_validations',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if inserting then',
'        :new.created    := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'    end if;',
'    :new.updated    := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'end;',
'/',
'show errors',
'',
'alter trigger eba_stds_test_validations_biu enable;',
''))
);
wwv_flow_api.component_end;
end;
/
