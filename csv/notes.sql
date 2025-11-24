SELECT
    sig_not.id,
    sig_not.created_at,
    sig_not.updated_at,
    sig_not._signal_id,
    sig_not.text
FROM
    signals_note sig_not;
