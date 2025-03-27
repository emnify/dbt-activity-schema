{% macro listagg_delimiter() %}
    {{ return(adapter.dispatch("listagg_delimiter", "dbt_activity_schema")())}}
{% endmacro %}

{% macro default__listagg_delimiter() %}
{%- do return(dbt.string_literal("\n")) -%}
{% endmacro %}

{% macro type_boolean() %}
    {{ return(adapter.dispatch("type_boolean", "dbt_activity_schema")())}}
{% endmacro %}

{% macro default__type_boolean() %}
{%- do return("boolean") -%}
{% endmacro %}

{% macro bigquery__type_boolean() %}
{%- do return("bool") -%}
{% endmacro %}


{% macro type_json() %}
    {{ return(adapter.dispatch("type_json", "dbt_activity_schema")())}}
{% endmacro %}

{% macro default__type_json() %}
{%- do return("json") -%}
{% endmacro %}

{% macro snowflake__type_json() %}
{%- do return("object") -%}
{% endmacro %}

{% macro bigquery__type_json() %}
{%- do return("json") -%}
{% endmacro %}
