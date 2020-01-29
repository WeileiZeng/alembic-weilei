---
layout: page
title: Resource and Library
feature_image: "https://picsum.photos/2560/600?image=873"
feature_text: |
  To learn more about quantum computing
excerpt: "resources for quantum computing"
---

{% for topic in site.topics %}
*  [{{ topic.name }}]({{ topic.web_url }})
{% endfor %}

## People/group
{% for item in site.people %}
* [{{ item.name }}]({{ item.web_url }})
{% endfor %}

## Colloquium
{% for item in site.links %}
* [{{ item.name }}]({{ item.web_url }})
{% endfor %}



