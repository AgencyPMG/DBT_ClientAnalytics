{% macro date_sub(date,interval) %}
    {% if target.type == 'bigquery' %}
        timestamp_sub({{date}}, interval {{interval}} day)
    {% elif target.type == 'redshift' %}
        dateadd(day,-{{interval}},{{date}})
    {% endif %}
{% endmacro %}