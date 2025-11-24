SELECT
    sig.id,
    sig.uuid AS signal_uuid,
    sig.source,
    sig.text,
    sig.text_extra,
    sig.created_at,
	sig.updated_at,
	sig.extra_properties,
	sig.category_assignment_id,
	sig.location_id,
	sig.reporter_id,
	sig.status_id,
    sig_prio.priority AS priority,
    sig_prio.created_at AS priority_created_at,
    sig.parent_id AS parent,
    sig_type.name AS "type",
    sig_type.created_at AS type_created_at,
	sig.directing_departments_assignment_id
FROM
    signals_signal sig
    JOIN signals_priority sig_prio ON sig.priority_id = sig_prio.id
	JOIN signals_type sig_type ON sig.type_assignment_id = sig_type.id
