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

    <ul class="tree-root">
      {% assign sorted_categories = site.categories | sort %}
      {% for category in sorted_categories %}
      <li class="tree-folder">
        <div class="tree-folder-head" onclick="this.parentElement.classList.toggle('collapsed')">
          <span class="tree-toggle" aria-hidden="true">▾</span>
          <span class="octicon octicon-file-directory tree-folder-icon"></span>
          <span class="tree-folder-name">{{ category[0] }}</span>
          <span class="tree-folder-count">{{ category[1].size }}</span>
        </div>

        <ul class="tree-children">
          <!-- 收集子分类 -->
          {% assign subcategories = "" %}
          {% for post in category[1] %}
            {% if post.categories.size > 1 %}
              {% assign subcat = post.categories[1] %}
              {% unless subcategories contains subcat %}
                {% assign subcategories = subcategories | append: "," | append: subcat %}
              {% endunless %}
            {% endif %}
          {% endfor %}

          {% if subcategories != "" %}
            <!-- 有子分类：渲染子文件夹 -->
            {% assign subcats_array = subcategories | remove_first: "," | split: "," %}
            {% for subcat in subcats_array %}
              {% if subcat != "" %}
              <li class="tree-subfolder">
                <div class="tree-subfolder-head" onclick="this.parentElement.classList.toggle('collapsed')">
                  <span class="tree-toggle sub" aria-hidden="true">▾</span>
                  <span class="octicon octicon-file-directory tree-subfolder-icon"></span>
                  <span class="tree-subfolder-name">{{ subcat }}</span>
                  {% assign sub_count = 0 %}
                  {% for post in category[1] %}
                    {% if post.categories[1] == subcat %}{% assign sub_count = sub_count | plus: 1 %}{% endif %}
                  {% endfor %}
                  <span class="tree-subfolder-count">{{ sub_count }}</span>
                </div>
                <ul class="tree-leaves">
                  {% assign sub_posts = category[1] | sort: 'date' | reverse %}
                  {% for post in sub_posts %}
                    {% if post.categories[1] == subcat %}
                    <li class="tree-leaf">
                      <a href="{{ site.url }}{{ post.url }}">
                        <span class="tree-leaf-date">{{ post.date | date: "%m-%d" }}</span>
                        <span class="tree-leaf-title">{{ post.title }}</span>
                      </a>
                    </li>
                    {% endif %}
                  {% endfor %}
                </ul>
              </li>
              {% endif %}
            {% endfor %}
          {% else %}
            <!-- 无子分类：直接列文章 -->
            {% assign direct_posts = category[1] | sort: 'date' | reverse %}
            {% for post in direct_posts %}
            <li class="tree-leaf">
              <a href="{{ site.url }}{{ post.url }}">
                <span class="tree-leaf-date">{{ post.date | date: "%m-%d" }}</span>
                <span class="tree-leaf-title">{{ post.title }}</span>
              </a>
            </li>
            {% endfor %}
          {% endif %}
        </ul>
      </li>
      {% endfor %}

      {% if site.categories.size == 0 %}
      <li class="folder-empty">还没有内容，先去 Note/ 里写一篇笔记吧。</li>
      {% endif %}
    </ul>
</section>
