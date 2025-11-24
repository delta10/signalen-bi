SELECT
    sig_stat.id,
    sig_stat.text,
    sig_stat.user,
    CASE
        WHEN sig_stat.state :: text = 'm' :: text THEN 'Gemeld' :: text
        WHEN sig_stat.state :: text = 'i' :: text THEN 'In afwachting van behandeling' :: text
        WHEN sig_stat.state :: text = 'b' :: text THEN 'In behandeling' :: text
        WHEN sig_stat.state :: text = 'h' :: text THEN 'On hold' :: text
        WHEN sig_stat.state :: text = 'ingepland' :: text THEN 'Ingepland' :: text
        WHEN sig_stat.state :: text = 'ready to send' :: text THEN 'Te verzenden naar extern systeem' :: text
        WHEN sig_stat.state :: text = 'o' :: text THEN 'Afgehandeld' :: text
        WHEN sig_stat.state :: text = 'a' :: text THEN 'Geannuleerd' :: text
        WHEN sig_stat.state :: text = 'reopenend' :: text THEN 'Heropend' :: text
        WHEN sig_stat.state :: text = 'reopened' :: text THEN 'Heropend' :: text
        WHEN sig_stat.state :: text = 's' :: text THEN 'Gesplitst' :: text
        WHEN sig_stat.state :: text = 'closure requested' :: text THEN 'Verzoek tot afhandeling' :: text
        WHEN sig_stat.state :: text = 'sent' :: text THEN 'Verzonden naar extern systeem' :: text
        WHEN sig_stat.state :: text = 'send failed' :: text THEN 'Verzending naar extern systeem mislukt' :: text
        WHEN sig_stat.state :: text = 'done external' :: text THEN 'Melding is afgehandeld in extern systeem' :: text
        WHEN sig_stat.state :: text = 'reopen requested' :: text THEN 'Verzoek tot heropenen' :: text
        WHEN sig_stat.state :: text = 'reaction requested' :: text THEN 'Reactie gevraagd' :: text
        WHEN sig_stat.state :: text = 'reaction received' :: text THEN 'Reactie ontvangen' :: text
        WHEN sig_stat.state :: text = 'forward to external' :: text THEN 'Doorgezet naar extern' :: text
        WHEN sig_stat.state :: text = '' :: text THEN 'Leeg' :: text
        ELSE NULL :: text
    END AS state_display,
    sig_stat.extern,
    sig_stat.created_at,
    sig_stat.updated_at,
    sig_stat.extra_properties,
    sig_stat._signal_id,
    sig_stat.state
FROM
	signals_status sig_stat