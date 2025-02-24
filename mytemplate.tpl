{% extends 'lab/index.html.j2' %}

{% block html_head %}
    {{ super() }}
    <link rel="stylesheet" href="mystyle.css">
    <h1>目次</h1>
    <ul>
    {% for cell in nb.cells if cell.cell_type == 'markdown' %}
        {% for line in cell.source.split('\n') %}
            {% if line.startswith('# ') %}
                <li><a href="#{{ line[2:] }}">{{ line[2:] }}</a></li>
            {% elif line.startswith('ß## ') %}
                <li style="margin-left: 20px;"><a href="#{{ line[3:] }}">{{ line[3:] }}</a></li>
            {% elif line.startswith('### ') %}
                <li style="margin-left: 40px;"><a href="#{{ line[4:] }}">{{ line[4:] }}</a></li>
            {% endif %}
        {% endfor %}
    {% endfor %}
    </ul>
{% endblock %}

