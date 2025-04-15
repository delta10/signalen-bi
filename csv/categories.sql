SELECT
    cas.id,
    maincat.name AS main_category,
    subcat.name AS sub_category,
    cas.created_at,
    cas.updated_at,
    cas.extra_properties,
    cas._signal_id,
    cas.deadline,
    cas.deadline_factor_3,
    STRING_AGG (dep.name, ', ') AS departments
FROM
    signals_categoryassignment cas
    JOIN signals_category subcat ON subcat.id = cas.category_id
    JOIN signals_category maincat ON maincat.id = subcat.parent_id
    JOIN signals_categorydepartment catdep ON catdep.category_id = subcat.id
    AND catdep.is_responsible
    JOIN signals_department dep ON catdep.department_id = dep.id
GROUP BY
    cas.id,
    maincat.name,
    subcat.name,
    cas.created_at,
    cas.updated_at,
    cas.extra_properties,
    cas._signal_id,
    cas.deadline,
    cas.deadline_factor_3;
