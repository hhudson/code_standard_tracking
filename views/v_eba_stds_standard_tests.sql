create or replace force view v_eba_stds_standard_tests as
select st.id,
    st.display_sequence,
    st.name,
    st.query_view,
    st.failure_help_text,
    st.test_type,
    (   select avg(test_duration) d
        from eba_stds_standard_statuses sss
        where sss.standard_id = st.standard_id
            and sss.test_id = st.id ) avg_duration,
    st.standard_id
from eba_stds_standard_tests st
order by st.display_sequence nulls last
;