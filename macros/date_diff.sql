{% macro date_diff(first_date, second_date, datepart) %}

    {% if target.type == 'bigquery' %}
        date_diff(
        {{second_date}},
        {{first_date}},
        {{datepart}}
    )

    {% elif target.type == 'redshift' %}
        datediff(
        {{ datepart }},
        {{first_date}},
        {{second_date}}
        )
    {% endif %}
{% endmacro %}