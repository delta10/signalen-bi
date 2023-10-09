SELECT
    maincat.name AS main_category,
    subcat.name AS sub_category,
    count(*) as total_feedback_requests,
    sum(case when feedback.is_satisfied is true then 1 else 0 end) is_satisfied,
    sum(case when feedback.is_satisfied is false then 1 else 0 end) is_not_satisfied
FROM
    feedback_feedback feedback
    JOIN signals_signal sig ON feedback._signal_id = sig.id
    JOIN signals_categoryassignment cas ON sig.category_assignment_id = cas.id
    JOIN signals_category subcat ON subcat.id = cas.category_id
    JOIN signals_category maincat ON maincat.id = subcat.parent_id
    LEFT JOIN signals_signaldepartments sigdep ON sig.routing_assignment_id = sigdep.id
    LEFT JOIN signals_signaldepartments_departments sigdepdep ON sigdep.id = sigdepdep.signaldepartments_id
    LEFT JOIN signals_department dep ON sigdepdep.department_id = dep.id
GROUP BY maincat.name, subcat.name;