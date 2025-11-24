SELECT
    fb._signal_id,
    fb.is_satisfied,
    fb.allows_contact,
	array_to_string(fb.text_list, ',') AS text,
    fb.text_extra
FROM
    feedback_feedback fb
ORDER BY
    fb._signal_id
