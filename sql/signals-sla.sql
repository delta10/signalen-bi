SELECT
    sig.id,
    sig.created_at AS created_at,
    maincat.name AS main_category,
    subcat.name AS sub_category,
    cas.deadline AS deadline,
    cas.deadline_factor_3 AS deadline_factor_3,
    CASE
        WHEN stat.state :: text = 'm' :: text THEN 'Gemeld' :: text
        WHEN stat.state :: text = 'i' :: text THEN 'In afwachting van behandeling' :: text
        WHEN stat.state :: text = 'b' :: text THEN 'In behandeling' :: text
        WHEN stat.state :: text = 'h' :: text THEN 'On hold' :: text
        WHEN stat.state :: text = 'ingepland' :: text THEN 'Ingepland' :: text
        WHEN stat.state :: text = 'ready to send' :: text THEN 'Te verzenden naar extern systeem' :: text
        WHEN stat.state :: text = 'o' :: text THEN 'Afgehandeld' :: text
        WHEN stat.state :: text = 'a' :: text THEN 'Geannuleerd' :: text
        WHEN stat.state :: text = 'reopenend' :: text THEN 'Heropend' :: text
        WHEN stat.state :: text = 'reopened' :: text THEN 'Heropend' :: text
        WHEN stat.state :: text = 's' :: text THEN 'Gesplitst' :: text
        WHEN stat.state :: text = 'closure requested' :: text THEN 'Verzoek tot afhandeling' :: text
        WHEN stat.state :: text = 'sent' :: text THEN 'Verzonden naar extern systeem' :: text
        WHEN stat.state :: text = 'send failed' :: text THEN 'Verzending naar extern systeem mislukt' :: text
        WHEN stat.state :: text = 'done external' :: text THEN 'Melding is afgehandeld in extern systeem' :: text
        WHEN stat.state :: text = 'reopen requested' :: text THEN 'Verzoek tot heropenen' :: text
        WHEN stat.state :: text = 'reaction requested' :: text THEN 'Reactie gevraagd' :: text
        WHEN stat.state :: text = 'reaction received' :: text THEN 'Reactie ontvangen' :: text
        WHEN stat.state :: text = '' :: text THEN 'Leeg' :: text
        ELSE NULL :: text
    END AS status
FROM
    signals_signal sig
    JOIN signals_status stat ON sig.status_id = stat.id
    JOIN signals_categoryassignment cas ON sig.category_assignment_id = cas.id
    JOIN signals_category subcat ON subcat.id = cas.category_id
    JOIN signals_category maincat ON maincat.id = subcat.parent_id