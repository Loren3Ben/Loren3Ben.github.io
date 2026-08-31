---
layout: categories
title: Categories
description: 按 Note 文件夹归类的全部笔记
keywords: 分类
comments: false
menu: 分类
permalink: /categories/
---

<section class="container posts-content">
    <h2 style="margin-bottom:4px;">📂 知识库</h2>
    <p style="color:#999;font-size:14px;margin-top:0;margin-bottom:18px;">按 Note 文件夹归类的笔记，点击文件夹展开/收起，点击文章标题直达正文。</p>

    {% comment %}收集所有有 categories 的 note 文档，并按主分类/子分类分组{% endcomment %}
    {% assign main_cats = "" %}
    {% for doc in site.note %}
      {% if doc.categories and doc.categories.size > 0 %}
        {% assign mc = doc.categories[0] %}
        {% unless main_cats contains mc %}
          {% assign main_cats = main_cats | append: "|" | append: mc %}
        {% endunless %}
      {% endif %}
    {% endfor %}
    {% assign main_cats_arr = main_cats | remove_first: "|" | split: "|" | sort %}

    <ul class="tree-root">
      {% for mc in main_cats_arr %}
      <li class="tree-folder">
        {% assign mc_count = 0 %}
        {% for doc in site.note %}
          {% if doc.categories and doc.categories[0] == mc %}{% assign mc_count = mc_count | plus: 1 %}{% endif %}
        {% endfor %}
        <div class="tree-folder-head" onclick="this.parentElement.classList.toggle('collapsed')">
          <span class="tree-toggle" aria-hidden="true">▾</span>
          <span class="octicon octicon-file-directory tree-folder-icon"></span>
          <span class="tree-folder-name">{{ mc }}</span>
          <span class="tree-folder-count">{{ mc_count }}</span>
        </div>

        <ul class="tree-children">
          {% comment %}收集该主分类下的子分类{% endcomment %}
          {% assign subcats = "" %}
          {% for doc in site.note %}
            {% if doc.categories and doc.categories[0] == mc and doc.categories.size > 1 %}
              {% assign sc = doc.categories[1] %}
              {% unless subcats contains sc %}
                {% assign subcats = subcats | append: "|" | append: sc %}
              {% endunless %}
            {% endif %}
          {% endfor %}

          {% if subcats != "" %}
            {% assign subcats_arr = subcats | remove_first: "|" | split: "|" | sort %}
            {% for sc in subcats_arr %}
            <li class="tree-subfolder">
              {% assign sc_count = 0 %}
              {% for doc in site.note %}
                {% if doc.categories and doc.categories.size > 1 and doc.categories[0] == mc and doc.categories[1] == sc %}
                  {% assign sc_count = sc_count | plus: 1 %}
                {% endif %}
              {% endfor %}
              <div class="tree-subfolder-head" onclick="this.parentElement.classList.toggle('collapsed')">
                <span class="tree-toggle sub" aria-hidden="true">▾</span>
                <span class="octicon octicon-file-directory tree-subfolder-icon"></span>
                <span class="tree-subfolder-name">{{ sc }}</span>
                <span class="tree-subfolder-count">{{ sc_count }}</span>
              </div>
              <ul class="tree-leaves">
                {% assign sub_docs = site.note | sort: 'date' | reverse %}
                {% for doc in sub_docs %}
                  {% if doc.categories and doc.categories.size > 1 and doc.categories[0] == mc and doc.categories[1] == sc %}
                  <li class="tree-leaf">
                    <a href="{{ site.url }}{{ doc.url }}">
                      <span class="tree-leaf-date">{{ doc.date | date: "%m-%d" }}</span>
                      <span class="tree-leaf-title">{{ doc.title }}</span>
                    </a>
                  </li>
                  {% endif %}
                {% endfor %}
              </ul>
            </li>
            {% endfor %}
          {% else %}
            {% comment %}无子分类：直接列文档{% endcomment %}
            {% assign direct_docs = site.note | sort: 'date' | reverse %}
            {% for doc in direct_docs %}
              {% if doc.categories and doc.categories[0] == mc and doc.categories.size == 1 %}
              <li class="tree-leaf">
                <a href="{{ site.url }}{{ doc.url }}">
                  <span class="tree-leaf-date">{{ doc.date | date: "%m-%d" }}</span>
                  <span class="tree-leaf-title">{{ doc.title }}</span>
                </a>
              </li>
              {% endif %}
            {% endfor %}
          {% endif %}
        </ul>
      </li>
      {% endfor %}

      {% if main_cats_arr.size == 0 %}
      <li class="folder-empty">还没有内容，先去 _note/ 里写一篇笔记吧。</li>
      {% endif %}
    </ul>
</section>
