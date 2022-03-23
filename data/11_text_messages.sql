declare 
c_default_app_id constant apex_applications.application_id%type := 130;
c_workspace      constant apex_workspaces.workspace%type := 'ILA';
begin
for c1 in (select workspace_id
                from apex_workspaces
                where workspace = c_workspace) 
loop
    apex_util.set_security_group_id( c1.workspace_id );
    exit;
end loop;

    begin <<view_meets_criteria>>
        apex_lang.create_message
            (   p_application_id  => c_default_app_id,
                p_language        => 'en',
                p_name            => 'VIEW_MEETS_CRITERIA',
                p_message_text    => 'View looks good!'
            );
    exception when dup_val_on_index then null;
    end view_meets_criteria;

    begin <<view_not_in_schema>>
        apex_lang.create_message
            (   p_application_id  => c_default_app_id,
                p_language        => 'en',
                p_name            => 'VIEW_NOT_IN_SCHEMA',
                p_message_text    => 'View not accessible in current schema.'
            );
    exception when dup_val_on_index then null;
    end view_not_in_schema;

    begin <<view_must_have_pass_fail>>
        apex_lang.create_message
            (   p_application_id  => c_default_app_id,
                p_language        => 'en',
                p_name            => 'VIEW_MUST_HAVE_PASS_FAIL',
                p_message_text    => 'The 1st field in the view must be PASS_FAIL.'
            );
    exception when dup_val_on_index then null;
    end view_must_have_pass_fail;

    begin <<view_must_have_app_id>>
        apex_lang.create_message
            (   p_application_id  => c_default_app_id,
                p_language        => 'en',
                p_name            => 'VIEW_MUST_HAVE_APP_ID',
                p_message_text    => 'The 3rd field in the view must be APPLICATION_ID.'
            );
    exception when dup_val_on_index then null;
    end view_must_have_app_id;

    begin <<view_must_have_ref_code>>
        apex_lang.create_message
            (   p_application_id  => c_default_app_id,
                p_language        => 'en',
                p_name            => 'VIEW_MUST_HAVE_REF_CODE',
                p_message_text    => 'The 2nd field in the view must be REFERENCE_CODE.'
            );
    exception when dup_val_on_index then null;
    end view_must_have_ref_code;
    
end;
/