SELECT
    loc._signal_id AS id,
    area._type_id AS type_id,
    area.code AS code
FROM
    signals_location loc
    LEFT JOIN signals_area area ON ST_Contains(
        area.geometry,
        loc.geometrie
    )
    JOIN signals_areatype areatype ON areatype.id = area._type_id;