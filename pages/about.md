---
layout: page
title: About
description: 个人笔记
keywords: Loren
comments: true
menu: 关于Loren
permalink: /about/
---

Loren，具身智能与机器人方向开发者，目前居于杭州。

本博客用于记录在机器人、具身智能、项目管理等领域的学习笔记与实践心得，权当自用归档，亦欢迎同行交流。

## 联系

<ul>
{% for website in site.data.social %}
<li>{{website.sitename }}：<a href="{{ website.url }}" target="_blank">@{{ website.name }}</a></li>
{% endfor %}
</ul>


## Skill Keywords

{% for skill in site.data.skills %}
### {{ skill.name }}
<div class="btn-inline">
{% for keyword in skill.keywords %}
<button class="btn btn-outline" type="button">{{ keyword }}</button>
{% endfor %}
</div>
{% endfor %}
