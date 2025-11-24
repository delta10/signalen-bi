SELECT
    sig_rep.id,
    sig_rep.email,
    sig_rep.phone,
    sig_rep.email_anonymized AS is_anonymized,
    sig_rep.created_at,
    sig_rep.updated_at,
    sig_rep._signal_id
FROM
	signals_reporter sig_rep