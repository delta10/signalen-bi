SELECT
    sig.id,
    auth_user.email AS assigned_to,
    sig_user.created_at AS assigned_at
FROM
    signals_signal sig
    JOIN signals_signaluser sig_user ON sig.user_assignment_id = sig_user.id
	JOIN auth_user ON sig_user.user_id = auth_user.id
