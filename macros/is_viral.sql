{% macro is_viral(view_count, like_count, comment_count, target) %}
    case 
        when {{ view_count }} > 5000 and ( {{ like_count }} + {{ comment_count }}) * 1.0 / nullif( {{ view_count }}, 0) >= {{ target }}
        then true
        else false
    end
{% endmacro %}