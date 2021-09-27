{{ config(materialized='table') }}

with unioned as (

    {{ dbt_utils.union_relations(get_staging_files(), 
                                {"account_id": "{{ 'int64' if target.name == 'bigquery' else 'bigint' }}"} ) }}

)

select *
from unioned