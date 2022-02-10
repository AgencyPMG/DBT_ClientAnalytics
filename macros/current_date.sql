{% macro current_date() %}
  {% if target.type == 'redshift' %}
       CURRENT_DATE
  {% elif target.type == 'bigquery' %}
       CURRENT_DATE()
  {% endif %}
{% endmacro %}
