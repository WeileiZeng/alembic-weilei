---
layout: page
title: Resource
feature_image: "https://miro.medium.com/max/1878/1*CQPNQqE4X2Jh5XomWQrWQQ.png"
#feature_image: "https://picsum.photos/2560/600?image=873"
excerpt: "resources for quantum computing"
---


{% for resource in site.data.resources %}
### {{ resource.group }}
{{ resource.description }}{% for item in resource.items %}
* <a href="{{ item.web_url }}" target="blank">{{ item.name }}</a> {{item.description}}
{% endfor %}{% endfor %}




