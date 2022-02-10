{% macro transform_hour(hour) %}
    {% if target.type == 'bigquery' %}
        CAST(CASE
            WHEN strpos({{hour}}, 'AM') > 0 AND strpos({{hour}}, '12') > 0 THEN '0'
            WHEN strpos({{hour}}, 'PM') > 0 AND strpos({{hour}}, '12') > 0 THEN '12'
            WHEN strpos({{hour}}, 'PM') > 0 THEN cast(cast(SPLIT({{hour}}, ' ')[SAFE_OFFSET(0)] AS INT64) + 12 AS STRING)
            WHEN strpos({{hour}}, 'AM') > 0 THEN SPLIT({{hour}}, ' ')[SAFE_OFFSET(0)]
            ELSE '999'
		END AS string)
    {% elif target.type == 'redshift' %}
        CAST(CASE
            WHEN strpos({{hour}}, 'AM') > 0 AND strpos({{hour}}, '12') > 0 THEN '0'
            WHEN strpos({{hour}}, 'PM') > 0 AND strpos({{hour}}, '12') > 0 THEN '12'
            WHEN strpos({{hour}}, 'PM') > 0 THEN cast(cast(split_part({{hour}}, ' ',1) AS integer) + 12 AS varchar)
            WHEN strpos({{hour}}, 'AM') > 0 THEN split_part({{hour}}, ' ',1)
            ELSE '999'
		END as varchar)
    {% endif %}
{% endmacro %}