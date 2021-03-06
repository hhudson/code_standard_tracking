declare
    type postfixes_t is table of varchar2(30);
    l_postfixes postfixes_t := postfixes_t(
                          '01','02','03','04',
                          '05','06','07','08',
                          'N01','N02','N03','N04',
                          'D01','D02','D03','D04',
                          'CLOB');

    type table_r is record (
        table_name        varchar2(30),
        report_css_class  varchar2(30),
        display_name_sing varchar2(128),
        display_name_plrl varchar2(128)
    );
    type tables_t is table of table_r index by varchar2(30);
    l_tables tables_t;

    l_tbl varchar2(30);
begin
    --
    l_tables('APPLICATION').table_name        := 'EBA_STDS_APPLICATIONS';
    l_tables('APPLICATION').report_css_class  := 'flex_applications';
    l_tables('APPLICATION').display_name_sing := 'Application';
    l_tables('APPLICATION').display_name_plrl := 'Applications';
    --
    l_tables('STANDARD').table_name        := 'EBA_STDS_STANDARDS';
    l_tables('STANDARD').report_css_class  := 'flex_standards';
    l_tables('STANDARD').display_name_sing := 'Standard';
    l_tables('STANDARD').display_name_plrl := 'Standards';
    --
    l_tables('TEST').table_name        := 'EBA_STDS_STANDARD_TESTS';
    l_tables('TEST').report_css_class  := 'flex_tests';
    l_tables('TEST').display_name_sing := 'Test';
    l_tables('TEST').display_name_plrl := 'Tests';
    --

    l_tbl := l_tables.FIRST;
    while l_tbl is not null loop
        for pf in 1..l_postfixes.COUNT loop
            merge into eba_stds_flex_registry dest
            using ( select l_tbl prefix,
                        l_tables(l_tbl).table_name table_name,
                        l_tbl||'_FLEX_'||l_postfixes(pf) column_name,
                        l_tables(l_tbl).report_css_class report_css_class,
                        l_tables(l_tbl).display_name_sing display_name_sing,
                        l_tables(l_tbl).display_name_plrl display_name_plrl,
                        case when l_postfixes(pf) = 'CLOB'
                            then 'TEXTAREA'
                            else 'TEXT'
                        end as display_as,
                        case when l_postfixes(pf) = 'CLOB'
                            then 80
                            else 30
                        end as width,
                        case when l_postfixes(pf) = 'CLOB'
                            then 30000
                            else 4000
                        end as max_width,
                        case when l_postfixes(pf) = 'CLOB'
                            then 5
                            else 1
                        end as height
                    from dual
            ) src
            on ( dest.flexible_table = src.table_name
                and dest.flexible_column = src.column_name )
            when not matched then
                insert (
                    dest.flexible_table,
                    dest.flexible_column,
                    dest.active_yn,
                    dest.form_label_text,
                    dest.is_required_yn,
                    --
                    dest.report_css_class,
                    dest.table_prefix,
                    dest.display_name_sing,
                    dest.display_name_plrl,
                    --
                    dest.label_template_id,
                    dest.display_as,
                    dest.width,
                    dest.max_width,
                    dest.height,
                    dest.is_displayed_on_ir,
                    dest.assigned_yn,
                    --
                    dest.condition_type,
                    dest.condition1,
                    dest.condition2
                )
                values (
                    src.table_name,
                    src.column_name,
                    'N',
                    src.column_name,
                    'N',
                    --
                    src.report_css_class,
                    src.prefix,
                    src.display_name_sing,
                    src.display_name_plrl,
                    --
                    0,
                    src.display_as,
                    src.width,
                    src.max_width,
                    src.height,
                    'N',
                    'N',
                    --
                    'EXISTS',
                    'select null from eba_stds_flex_registry '
                        ||'where flexible_table = '''||src.table_name
                        ||''' and flexible_column = '''||src.column_name
                        ||''' and active_yn = ''Y'''
                        ||' and assigned_yn = ''Y''',
                    null
                );
        end loop;
        l_tbl := l_tables.NEXT( l_tbl );
    end loop;
end;
/
show errors

commit;