{% macro parse_german_date(column_name) %}
    TO_DATE('{{ column_name }}', 'DD.MM.YYYY')
{% endmacro %}