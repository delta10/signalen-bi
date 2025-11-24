SELECT
	sig_loc.id,
	ST_X(sig_loc.geometrie) AS lat,
	ST_Y(sig_loc.geometrie) AS lng,
	sig_loc.address,
	sig_loc.address_text,
	sig_loc.created_at,
	sig_loc.updated_at,
	sig_loc.extra_properties,
	sig_loc._signal_id,
    sig_loc.address->>'openbare_ruimte' AS address_street,
    sig_loc.address->>'huisnummer' AS address_number,
    sig_loc.address->>'postcode' AS address_postalcode,
    sig_loc.address->>'woonplaats' AS address_city,
    sig_loc.area_code,
    sig_loc.area_name
FROM
    signals_location sig_loc;
