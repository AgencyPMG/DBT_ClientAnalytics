{% macro date_add(date,interval) %}
    {% if target.type == 'bigquery' %}
        DATE_ADD({{date}}, interval {{interval}} day)
    {% elif target.type == 'redshift' %}
        dateadd(day,{{interval}},{{date}})
    {% endif %}
{% endmacro %}