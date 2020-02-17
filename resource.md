---
layout: page
title: Resource and Library
feature_image: "https://miro.medium.com/max/1878/1*CQPNQqE4X2Jh5XomWQrWQQ.png"
#feature_image: "https://picsum.photos/2560/600?image=873"
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

## IT stack
I learn programming/web skills all the time.
{% for item in site.it %}
* [{{ item.name }}]({{ item.web_url }})
{% endfor %}



