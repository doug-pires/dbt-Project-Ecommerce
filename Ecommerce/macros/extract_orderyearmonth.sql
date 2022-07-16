{% macro extract_orderyearmonth(
        column_year,
        column_month
    ) %}
    {{ column_year }} * 100 + {{ column_month }}
{% endmacro %}
