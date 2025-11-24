SELECT
    sigdep.id,
    sigdep.created_at,
    sigdep.updated_at,
    sigdep._signal_id,
    STRING_AGG (dep.name, ', ') AS departments
FROM
    signals_signaldepartments sigdep
    LEFT JOIN signals_signaldepartments_departments sigdepdep ON sigdep.id = sigdepdep.signaldepartments_id
    LEFT JOIN signals_department dep ON sigdepdep.department_id = dep.id
WHERE
    sigdep.relation_type = 'routing'
GROUP BY
    sigdep.id,
    sigdep.created_at,
    sigdep.updated_at,
    sigdep._signal_id
ORDER BY
    sigdep._signal_id,
    sigdep.id DESC
