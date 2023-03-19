{% macro email_to_domain(column_name) %}
    lower(split_part({{ column_name }}, '@', 2))
{% endmacro %}