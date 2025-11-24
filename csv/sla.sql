SELECT
    sig_slo.id,
	maincat.name AS main,
	subcat.name AS sub,
	sig_slo.n_days,
	sig_slo.use_calendar_days,
	sig_slo.created_at
FROM
    signals_servicelevelobjective sig_slo
    JOIN signals_category subcat ON subcat.id = sig_slo.category_id
    JOIN signals_category maincat ON maincat.id = subcat.parent_id
ORDER BY main, sub, created_at DESC
