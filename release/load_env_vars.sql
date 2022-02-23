-- GENERATED from build/build.sh DO NOT modify this file directly as all changes will be overwritten upon next build\n\n
define env_schema_name=ILA
define env_apex_app_ids=128
define env_apex_workspace=ILA


prompt ENV variables
select 
  '&env_schema_name.' env_schema_name,
  '&env_apex_app_ids.' env_apex_app_ids,
  '&env_apex_workspace.' env_apex_workspace
from dual;


