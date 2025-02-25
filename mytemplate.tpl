{% extends 'lab/index.html.j2' %}

{% block html_head %}
    {{ super() }}
    <link rel="stylesheet" href="mystyle.css">
    <div class="title">
    {% for cell in nb.cells if 'title' in cell.metadata.get('tags', []) %}
        {% for line in cell.source.split('\n') %}
            {% if line.startswith('% ') %}
                <h1>{{ line[2:] }}</h1>
            {% elif line.startswith('%% ') %}
                <p>{{ line[3:] }}</p>
            {% endif %}
        {% endfor %}
    {% endfor %}
    </div>
    <h2 style="margin-left:20px;">目次</h2>
    <ul>
    {% for cell in nb.cells if cell.cell_type == 'markdown' and 'title' not in cell.metadata.get('tags', []) %}
        {% for line in cell.source.split('\n') %}
            {% if line.startswith('# ') %}
                <li style="margin-left: 20px;"><a href="#{{ line[2:] }}">{{ line[2:] }}</a></li>
            {% elif line.startswith('## ') %}
                <li style="margin-left: 40px;"><a href="#{{ line[3:] }}">{{ line[3:] }}</a></li>
            {% elif line.startswith('### ') %}
                <li style="margin-left: 60px;"><a href="#{{ line[4:] }}">{{ line[4:] }}</a></li>
            {% endif %}
        {% endfor %}
    {% endfor %}
    </ul>
{% endblock html_head　%}


{% block body %}
    {{ super() }} 
{% endblock body %}
