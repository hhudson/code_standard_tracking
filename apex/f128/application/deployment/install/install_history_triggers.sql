prompt --application/deployment/install/install_history_triggers
begin
--   Manifest
--     INSTALL: INSTALL-History Triggers
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
 p_id=>wwv_flow_api.id(2530116561729366361)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'History Triggers'
,p_sequence=>160
,p_script_type=>'INSTALL'
,p_condition_type=>'NEVER'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger au_eba_stds_widgets',
'    after update on eba_stds_widgets',
'    for each row',
'declare',
'    ov varchar2(4000) := null;',
'    nv varchar2(4000) := null;',
'begin',
'    -- TAGS (default)',
'    if nvl(:old.tags, ''0'') != nvl(:new.tags,''0'') then ',
'        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values ',
'            (''WIDGETS'', :new.row_key, :new.id, ''TAGS'', substr(:old.tags,0,4000), substr(:new.tags,0,4000) ); ',
'    end if;',
'    -- WIDGET_NAME (default)',
'    if nvl(:old.widget_name, ''0'') != nvl(:new.widget_name,''0'') then ',
'        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values ',
'            (''WIDGETS'', :new.row_key, :new.id, ''WIDGET_NAME'', substr(:old.widget_name,0,4000), substr(:new.widget_name,0,4000) ); ',
'    end if;',
'    -- WIDGET_OWNER (default)',
'    if nvl(:old.widget_owner, ''0'') != nvl(:new.widget_owner,''0'') then ',
'        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values ',
'            (''WIDGETS'', :new.row_key, :new.id, ''WIDGET_OWNER'', substr(:old.widget_owner,0,4000), substr(:new.widget_owner,0,4000) ); ',
'    end if;',
'    -- CONTRIBUTOR_1 (default)',
'    if nvl(:old.contributor_1, ''0'') != nvl(:new.contributor_1,''0'') then ',
'        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values ',
'            (''WIDGETS'', :new.row_key, :new.id, ''CONTRIBUTOR_1'', substr(:old.contributor_1,0,4000), substr(:new.contributor_1,0,4000) ); ',
'    end if;',
'    -- CONTRIBUTOR_2 (default)',
'    if nvl(:old.contributor_2, ''0'') != nvl(:new.contributor_2,''0'') then ',
'        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values ',
'            (''WIDGETS'', :new.row_key, :new.id, ''CONTRIBUTOR_2'', substr(:old.contributor_2,0,4000), substr(:new.contributor_2,0,4000) ); ',
'    end if;',
'    -- CONTRIBUTOR_3 (default)',
'    if nvl(:old.contributor_3, ''0'') != nvl(:new.contributor_3,''0'') then ',
'        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values ',
'            (''WIDGETS'', :new.row_key, :new.id, ''CONTRIBUTOR_3'', substr(:old.contributor_3,0,4000), substr(:new.contributor_3,0,4000) ); ',
'    end if;',
'    -- CONTRIBUTOR_4 (default)',
'    if nvl(:old.contributor_4, ''0'') != nvl(:new.contributor_4,''0'') then ',
'        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values ',
'            (''WIDGETS'', :new.row_key, :new.id, ''CONTRIBUTOR_4'', substr(:old.contributor_4,0,4000), substr(:new.contributor_4,0,4000) ); ',
'    end if;',
'    -- WIDGET_DESCRIPTION (default)',
'    if nvl(:old.widget_description, ''0'') != nvl(:new.widget_description,''0'') then ',
'        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values ',
'            (''WIDGETS'', :new.row_key, :new.id, ''WIDGET_DESCRIPTION'', substr(:old.widget_description,0,4000), substr(:new.widget_description,0,4000) ); ',
'    end if;',
'end au_eba_stds_widgets;',
'/',
'',
'alter trigger au_eba_stds_widgets enable',
'/',
''))
);
wwv_flow_api.component_end;
end;
/
