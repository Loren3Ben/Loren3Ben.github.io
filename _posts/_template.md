---
# 于此处选择正文要使用的布局，文章用 post；其他可用：page、default、gallery、mindmap
layout: post
title: 文章标题
# 分类，可填多个；格式 [大类, 小类]，例如 [Knowledge, github]
categories: [Knowledge, template]
# 一句话描述，会展示在文章列表与搜索引擎结果中
description: 这里写一句话摘要，概括文章内容。
# 关键词，逗号分隔，用于 SEO
keywords: keyword1, keyword2
# 以下为可选增强组件，按需开启（true / false）
mermaid: false      # Mermaid 流程图
sequence: false     # 时序图
flow: false         # flowchart.js 流程图
mathjax: false      # 数学公式
mindmap: false      # 思维导图
mindmap2: false     # 思维导图（另一风格）
---

正文从这里开始。

## 一、二级标题

正文段落。

## 二、图片

图片资源统一放在 `images/posts/<分类>/` 下，引用方式：

![示例图片](/images/posts/template/example.png)

## 三、代码块

```python
def hello():
    print("Hello, Loren Blog")
```

## 四、引用

> 这是一段引用。

## 五、列表

1. 有序列表项一
2. 有序列表项二

- 无序列表项
- 无序列表项
