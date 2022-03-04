prompt --application/deployment/install/install_ast_views
begin
--   Manifest
--     INSTALL: INSTALL-ast views
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
 p_id=>wwv_flow_api.id(17651621226722364)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'ast views'
,p_sequence=>380
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE FORCE VIEW "V_AST_APEX_ACCESSIBILITY_ITEM_LABEL" ("PASS_FAIL", "ITEM_ID", "ITEM_NAME", "LABEL", "PAGE_ID", "PAGE_NAME", "DISPLAY_AS", "APPLICATION_ID") AS ',
'  select ',
'case when (pi.label is null or pi.label = ''&nbsp'')',
'     and pi.display_as not in (''Hidden'')',
'     then ''N''',
'     else ''Y''',
'     end pass_fail,',
'pi.item_id,',
'pi.item_name,',
'pi.label,',
'pi.page_id,',
'pi.page_name,',
'pi.display_as,',
'pi.application_id',
'from apex_application_page_items pi',
'order by pi.application_id, pi.page_id, pi.item_name;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_APEX_ACCESSIBILITY_THEME" ("PASS_FAIL", "APPLICATION_ID", "APPLICATION_NAME", "THEME_NUMBER", "THEME_NAME", "IS_ACCESSIBLE") AS ',
'  select ',
'case when ts.is_accessible = ''Yes''',
'     then ''Y''',
'     else ''N''',
'     end as pass_fail,',
'ts.application_id,',
'ts.application_name,',
'ts.theme_number,',
'ts.name theme_name,',
'ts.is_accessible',
'from apex_application_theme_styles ts',
'where ts.is_current = ''Yes''',
'order by ts.application_id;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_APEX_APP_AUTH" ("PASS_FAIL", "APPLICATION_ID", "APPLICATION_NAME", "AUTHORIZATION_SCHEME") AS ',
'  select ',
'case when authorization_scheme is null',
'    then ''N''',
'    else ''Y''',
'    end as pass_fail, ',
'application_id, ',
'application_name,',
'authorization_scheme',
'from apex_applications ',
'order by  application_id;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_APEX_APP_ITEM_NAMING" ("PASS_FAIL", "APPLICATION_ITEM_ID", "APPLICATION_ID", "APPLICATION_NAME", "ITEM_NAME", "SCOPE") AS ',
'  select ',
'case when item_name like ''G_%''',
'     then ''Y''',
'     else ''N''',
'     end as pass_fail,',
'application_item_id,',
'application_id, ',
'application_name, ',
'item_name, ',
'scope',
'from apex_application_items',
'order by application_id, item_name;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_APEX_HTML_ESCAPING_COLS" ("PASS_FAIL", "REGION_ID", "APPLICATION_ID", "APPLICATION_NAME", "PAGE_ID", "REGION_NAME", "COLUMN_ALIAS", "REPORT_LABEL", "REPORT_TYPE") AS ',
'  select ',
'case when display_text_as = ''WITHOUT_MODIFICATION''',
'     then ''N''',
'     else ''Y''',
'     end as pass_fail,',
'region_id, ',
'application_id, ',
'application_name,',
'page_id,',
'region_name, ',
'column_alias,',
'report_label,',
'''IR'' report_type',
'from apex_application_page_ir_col  ',
'union all',
'select ',
'case when escape_on_http_output =''Yes''',
'     then ''Y''',
'     else ''N''',
'     end as pass_fail, ',
'region_id, ',
'application_id, ',
'application_name,',
'page_id,',
'region_name, ',
'name,',
'heading,',
'''IG'' report_type',
'from apex_appl_page_ig_columns',
'order by application_id, page_id, region_name, column_alias;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_APEX_ITEM_HELP" ("PASS_FAIL", "ITEM_ID", "PAGE_ID", "ITEM_NAME", "INLINE_HELP_TEXT", "ITEM_HELP_TEXT", "APPLICATION_ID") AS ',
'  select ',
'case when aai.inline_help_text is null',
'     and  aai.item_help_text is null',
'     and  aai.display_as not in (''Hidden'')',
'     then ''N''',
'     else ''Y''',
'     end as pass_fail,  ',
'aai.item_id,',
'aai.page_id,',
'aai.item_name, ',
'aai.inline_help_text, ',
'aai.item_help_text,',
'aai.application_id',
'from apex_application_page_items aai',
'order by aai.application_id, aai.page_id, aai.item_id;',
'',
unistr('CREATE OR REPLACE FORCE VIEW "V_AST_APEX_PAGE_AUTH" ("PASS_FAIL", "PAGE_ID", "PAGE_NAME", "PAGE_ACCESS_PROTECT\00C5ION", "PAGE_MODE", "PAGE_REQUIRES_AUTHENTICATION", "APPLICATION_ID") AS '),
'  select ',
'case when aap.page_requires_authentication = ''Yes''',
'     and aap.authorization_scheme is null',
'     then ''N''',
'     else ''Y''',
'     end as pass_fail, ',
'aap.page_id, ',
'aap.page_name, ',
unistr('aap.page_access_protect\00E5ion, '),
'aap.page_mode,',
'aap.page_requires_authentication,',
'aap.application_id',
'from apex_application_pages aap',
'order by aap.application_id, aap.page_id;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_APEX_PAGE_HELP" ("PASS_FAIL", "PAGE_ID", "PAGE_NAME", "HELP_TEXT", "APPLICATION_ID") AS ',
'  select ',
'case when aap.help_text is null',
'     then ''N''',
'     else ''Y''',
'     end as pass_fail,',
'aap.page_id, ',
'aap.page_name,',
'aap.help_text,',
'aap.application_id',
'from apex_application_pages aap',
'order by aap.application_id, aap.page_id;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_APEX_PAGE_ITEM_NAMING" ("PASS_FAIL", "ITEM_ID", "ITEM_NAME", "APPLICATION_NAME", "APPLICATION_ID", "PAGE_ID", "PAGE_NAME", "REGION") AS ',
'  select ',
'case when pi.item_name like ''P''||pi.page_id||''_%''',
'     then ''Y''',
'     else ''N''',
'     end as pass_fail,',
'pi.item_id, ',
'pi.item_name, ',
'pi.application_name, ',
'pi.application_id, ',
'pi.page_id, ',
'pi.page_name, ',
'pi.region',
'from apex_application_page_items pi',
'where pi.page_id not like ''%.%'' --indicates a translated app ',
'order by  pi.application_name, pi.application_id, pi.page_id, pi.page_name, pi.region, pi.item_id;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_DB_PLSQL_ALL" ("PASS_FAIL", "REFERENCE_CODE", "ISSUE", "OBJECT_NAME", "OBJECT_TYPE", "LINE", "CODE", "CHECK_TYPE") AS ',
'  select ',
'case when a.issue is null ',
'     then ''Y''',
'     else ''N''',
'     end as pass_fail,',
'apex_string.format(''%0:%1:%2'', a.object_name, a.object_type, a.line) reference_code,',
'a.issue,',
'a.object_name, ',
'a.object_type, ',
'a.line,',
'a.code,',
'a.check_type',
'from',
'(select cs.issue, cs.object_name, cs.object_type, cs.line, cs.code, cs.check_type',
'    from v_ast_db_plsql_commented_specs cs',
' union all',
' select dc.issue, dc.object_name, dc.object_type, dc.line, dc.code, dc.check_type',
'    from v_ast_db_plsql_deprecated_code dc',
' union all ',
' select ds.issue, ds.object_name, ds.object_type, ds.line, ds.code, ds.check_type',
'    from v_ast_db_plsql_duplicate_statements ds',
' union all ',
' select inm.issue, inm.object_name, inm.object_type, inm.line, inm.code, inm.check_type',
'   from v_ast_db_plsql_identifier_naming inm',
' union all ',
' select ui.issue, ui.object_name, ui.object_type, ui.line, ui.code, ui.check_type',
'   from v_ast_db_plsql_unusued_identifiers ui ',
') a',
'where a.issue is not null',
'order by a.check_type, a.issue, a.object_name, a.line;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_DB_PLSQL_COMMENTED_SPECS" ("ISSUE", "PROC_NAME", "OBJECT_NAME", "OBJECT_TYPE", "LINE", "CODE", "CHECK_TYPE") AS ',
'  with proc_declrtns as (',
'    select line, name, object_name',
'    from user_identifiers',
'    where type  in (''PROCEDURE'',''FUNCTION'')',
'    and object_type = ''PACKAGE''',
'    and usage  = ''DECLARATION''',
'    order by object_name, line, name)',
'select ',
'case when trim(us.text) = ''------------------------------------------------------------------------------''',
'     then null',
'     else ''This procedure appears to be missing a comment or the comment is incorrectly formatted.''',
'     end as issue,   ',
'pd.name proc_name,',
'pd.object_name,',
'us.type object_type,',
'pd.line,',
'us.text code,',
'''Verifying procedures have comments in package specs'' check_type',
'from user_source us ',
'inner join proc_declrtns pd on  us.type = ''PACKAGE''',
'                            and us.name = pd.object_name',
'                            and us.line = (pd.line - 1)',
'order by pd.object_name, pd.line;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_DB_PLSQL_DEPRECATED_CODE" ("ISSUE", "OBJECT_TYPE", "OBJECT_NAME", "CODE", "LINE", "CHECK_TYPE") AS ',
'  select',
'case when lower(us.text) like ''%nvl%''',
'     then ''Replace with coalesce''',
'     when lower(us.text) like ''%decode%''',
'     then ''Replace with CASE statement''',
'     when lower(us.text) like ''%goto %''',
'     then ''GOTO is deprecated''',
'     end as issue,',
'us.type object_type,',
'us.name object_name, ',
'us.text code, ',
'us.line,',
'''Checking for Deprecated Code'' check_type',
'from user_source us',
'order by us.type, us.name, us.text, us.line;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_DB_PLSQL_DUPLICATE_STATEMENTS" ("ISSUE", "OBJECT_NAME", "OBJECT_TYPE", "LINE", "CODE", "CHECK_TYPE") AS ',
'  select',
'''This statement appears more than once.'' issue,',
'us.object_name, ',
'us.object_type,',
'us.line, ',
'us.text code,',
'''Checking for duplicate statements'' check_type',
'from user_statements us',
'inner join (select sql_id',
'            from user_statements ',
'            where sql_id is not null ',
'            having count(*) > 1',
'            group by sql_id ) sc on sc.sql_id = us.sql_id',
'order by us.object_name, object_type, us.line;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_DB_PLSQL_IDENTIFIER_NAMING" ("ISSUE", "OBJECT_NAME", "CODE", "OBJECT_TYPE", "LINE", "CHECK_TYPE") AS ',
'  with proc_start as (',
'    select ui.object_name, min(UI.line) start_line',
'        from user_identifiers ui',
'        where 1=1',
'        AND object_type = ''PACKAGE BODY''',
'        and type in (''FUNCTION'', ''PROCEDURE'')',
'        and usage in (''DEFINITION'')',
'        group by ui.object_name)',
'select',
'case when ui.type = ''CONSTANT'' ',
'        then case when ui.object_type = ''PACKAGE''',
'                  then case when (ui.name not like ''G_%'' or ui.name not like ''GC_%'') ',
'                            then ''Package spec constants must begin with g_ or gc_''',
'                            end',
'                  when ui.object_type = ''PACKAGE BODY'' ',
'                    then case when ui.line < ps.start_line',
'                              then case when (ui.name not like ''G_%'' or ui.name not like ''GC_%'') ',
'                                        then ''Package body global constants must begin with g_ or gc_''',
'                                        end',
'                              when (ui.name not like ''C_%'' or ui.name not like ''K_%'')',
'                              then ''Package body local constants must begin with c_ or k_''',
'                              end',
'                 end',
'     when ui.type = ''VARIABLE''',
'     then case when ui.object_type = ''PACKAGE''',
'               then ''Variables in the package spec are forbidden''',
'               when ui.name not like ''L_%''',
'               then ''Local variables must begin with l_''',
'               end',
'     when ui.type in (''CURSOR'',''REFCURSOR'') ',
'     then case when ui.name not like ''CUR_%''',
'               then ''Cursor names must begin with cur_''',
'               end ',
'     when ui.type in (''INDEX TABLE'', ''NESTED TABLE'', ''ASSOCIATIVE ARRAY'') ',
'     then case when ui.name not like ''T_%''',
'               then ''Table types must begin with t_''',
'               end',
'     when ui.type in (''FORMAL IN'',''FORMAL OUT'', ''FORMAL IN OUT'') ',
'     then case when ui.name not like ''P_%''',
'               then ''Procedure parameters must begin with p_''',
'               end',
'     when ui.type = ''RECORD''',
'     then case when ui.name not like ''R_%''',
'               then ''Record types must begin with r_''',
'               end ',
'     when ui.type in (''BLOB DATATYPE'',''BOOLEAN DATATYPE'',''CHARACTER DATATYPE'',''CLOB DATATYPE'',''DATE DATATYPE'',''NUMBER DATATYPE'', ''SUBTYPE'',''TIMESTAMP DATATYPE'')',
'     then case when ui.name not like ''TY_%''',
'               then ''Datatypes must begin with ty_''',
'               end',
'     when ui.type = ''EXCEPTION''',
'     then case when ui.name not like ''E_%''',
'               then ''Exceptions must begin with e_''',
'               end',
'     end as issue,',
'ui.object_name, ',
'ui.name code, ',
'ui.type object_type, ',
'ui.line,',
'''Enforcing identifier naming conventions'' check_type',
'from   user_identifiers ui',
'left join proc_start ps on  ui.object_name = ps.object_name',
'                        and ui.object_type = ''PACKAGE BODY''',
'where  ui.usage = ''DECLARATION''',
'order by ui.object_name, ui.object_type, ui.name, ui.type, ui.line;',
'',
'CREATE OR REPLACE FORCE VIEW "V_AST_DB_PLSQL_UNUSUED_IDENTIFIERS" ("ISSUE", "OBJECT_NAME", "OBJECT_TYPE", "CODE", "TYPE", "LINE", "CHECK_TYPE") AS ',
'  with  declared_ids  ',
'            as (select object_name  ',
'                  , object_type  ',
'                  , name',
'                  , type',
'                  , signature',
'                  , line',
'                  from user_identifiers  ',
'                  where     usage = ''DECLARATION''',
'                  and type in (''VARIABLE'', ''EXCEPTION'')),  ',
'      used_count',
'            as (select signature, count(*) refcount',
'                  from user_identifiers   ',
'                  where usage = ''REFERENCE''',
'                  group by signature)  ',
'select ',
'case when uc.signature is null',
'     then ''This identifier has been declared but is not referenced anywhere. Please delete.''',
'     end as issue,',
'di.object_name, ',
'di.object_type, ',
'di.name code, ',
'di.type,',
'di.line,',
'''Checking for unused identifiers'' check_type',
'from declared_ids di',
'left join used_count uc on  di.signature = uc.signature',
'order by di.object_name, di.object_type, di.name, di.type;',
'',
''))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17651789556722375)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_APEX_ACCESSIBILITY_ITEM_LABEL'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17651935967722376)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_APEX_ACCESSIBILITY_THEME'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17652161370722376)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_APEX_APP_AUTH'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17652366165722376)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_APEX_APP_ITEM_NAMING'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17652554567722377)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_APEX_HTML_ESCAPING_COLS'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17652712504722377)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_APEX_ITEM_HELP'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17652987877722377)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_APEX_PAGE_AUTH'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17653101622722377)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_APEX_PAGE_HELP'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17653325099722377)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_APEX_PAGE_ITEM_NAMING'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17653575009722377)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_DB_PLSQL_ALL'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17653765138722377)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_DB_PLSQL_COMMENTED_SPECS'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17653900287722377)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_DB_PLSQL_DEPRECATED_CODE'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17654163836722377)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_DB_PLSQL_DUPLICATE_STATEMENTS'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17654386673722378)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_DB_PLSQL_IDENTIFIER_NAMING'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(17654513013722378)
,p_script_id=>wwv_flow_api.id(17651621226722364)
,p_object_owner=>'#OWNER#'
,p_object_type=>'VIEW'
,p_object_name=>'V_AST_DB_PLSQL_UNUSUED_IDENTIFIERS'
,p_last_updated_by=>'HAYDEN'
,p_last_updated_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
,p_created_by=>'HAYDEN'
,p_created_on=>to_date('20220304154417','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
