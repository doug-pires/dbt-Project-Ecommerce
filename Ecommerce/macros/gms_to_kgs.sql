-- Build a macrthat convert mgs to kgs
{%- macro gms_to_kgs(column_name) -%}
    ROUND (div0 ({{ column_name }}, 1000), 1)
{%- endmacro -%}
