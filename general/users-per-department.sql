SELECT
    dep.code AS code,
    dep.name AS name,
    usr.username AS username
FROM
    signals_department dep
    LEFT JOIN users_profile_departments profdep ON dep.id = profdep.department_id
    JOIN users_profile prof ON profdep.profile_id = prof.id
    JOIN auth_user usr ON prof.user_id = usr.id;