{%- macro generate_activity_id(field_list) -%}
    {{ return(adapter.dispatch('generate_activity_id', 'dbt_activity_schema')(field_list)) }}
{% endmacro %}

{%- macro default__generate_activity_id(field_list) -%}

{%- if var('surrogate_key_treat_nulls_as_empty_strings', False) -%}
    {%- set default_null_value = "" -%}
{%- else -%}
    {%- set default_null_value = '_dbt_utils_surrogate_key_null_' -%}
{%- endif -%}

{%- set fields = [] -%}

{%- for field in field_list -%}

    {%- do fields.append(
        "coalesce(cast(" ~ field ~ " as " ~ dbt.type_string() ~ "), '" ~ default_null_value  ~"')"
    ) -%}

    {%- if not loop.last %}
        {%- do fields.append("'-'") -%}
    {%- endif -%}

{%- endfor -%}

{{ dbt.hash(dbt.concat(fields)) }}

{%- endmacro -%}
