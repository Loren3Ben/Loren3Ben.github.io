# 码志

我的个人博客：<https://mazhuang.org>，欢迎 Star 和 Fork。

## 概览

<!-- vim-markdown-toc GFM -->

* [效果预览](#效果预览)
* [Fork 指南](#fork-指南)
* [使用文档](#使用文档)
* [经验与思考](#经验与思考)
* [联系我](#联系我)
* [致谢](#致谢)

<!-- vim-markdown-toc -->

## 效果预览

**[在线预览 &rarr;](https://mazhuang.org)**

![screenshot home](https://mazhuang.org/assets/images/screenshots/home.png)

## Fork 指南

Fork 本项目之后，还需要做一些事情才能让你的页面「正确」跑起来。

1. 正确设置项目名称与分支。

   按照 GitHub Pages 的规定，名称为 `username.github.io` 的项目的 master 分支，或者其它名称的项目的 gh-pages 分支可以自动生成 GitHub Pages 页面。

2. 修改域名。

   如果你需要绑定自己的域名，那么修改 CNAME 文件的内容，并参考 [配置 GitHub Pages 站点的自定义域](https://docs.github.com/cn/pages/configuring-a-custom-domain-for-your-github-pages-site) 做好配置；如果不需要绑定自己的域名，那么删掉 CNAME 文件。

3. 修改配置。

   网站的配置基本都集中在 \_config.yml 文件中，将其中与个人信息相关的部分替换成你自己的，比如网站的 url、title、subtitle 和第三方评论模块的配置等。

   **评论模块：** 目前支持 disqus、gitment、gitalk、utterances、beaudar 和 giscus，选用其中一种就可以了，推荐使用 giscus。它们各自的官方配置指南链接在 \_config.yml 文件的 Comments 一节里都贴出来了，请参考官方指南配置。

   **注意：** 如果使用 disqus，因为 disqus 处理用户名与域名白名单的策略存在缺陷，请一定将 disqus.username 修改成你自己的，否则请将该字段留空。我对该缺陷的记录见 [Issues#2][3]。

4. 删除我的文章与图片。

   如下文件夹中除了 template.md 文件外，都可以全部删除，然后添加你自己的内容。

   * \_posts 文件夹中是我已发布的博客文章。
   * \_drafts 文件夹中是我尚未发布的博客文章。
   * \_wiki 文件夹中是我已发布的 wiki 页面。
   * \_fragments 文件夹中是我已发布的短文片段。
   * images 文件夹中是我的文章和页面里使用的图片。

5. 修改「关于」页面。

   pages/about.md 文件内容对应网站的「关于」页面，里面的内容多为个人相关，将它们替换成你自己的信息，包括 \_data 目录下的 skills.yml 和 social.yml 文件里的数据。

   skills.yml 和 social.yml 里内容的含义可以参考：[_data 目录下的 yml 文件内容含义](https://mazhuang.org/2020/05/03/blog-template-qna/#_data-%E7%9B%AE%E5%BD%95%E4%B8%8B%E7%9A%84-yml-%E6%96%87%E4%BB%B6%E5%86%85%E5%AE%B9%E5%90%AB%E4%B9%89)。

## 如何使用

本博客基于 [Jekyll](https://jekyllrb.com/) 静态站点生成器，托管于 [GitHub Pages](https://docs.github.com/pages)，构建由根目录 `.github/workflows/jekyll.yml` 自动完成。下面是完整的使用框架与操作步骤。

### 技术栈一览

| 组件 | 版本/说明 |
| --- | --- |
| Ruby | 3.1（CI 已锁定，本地建议保持一致） |
| Jekyll | 随 `github-pages` gem 发布，与 GitHub Pages 生产环境一致 |
| 依赖管理 | Bundler（`Gemfile` + `Gemfile.lock`） |
| Markdown 渲染 | kramdown（GFM 输入） + rouge 高亮 |
| 评论组件 | giscus（默认，可切换 disqus/gitalk/utterances/beaudar） |
| 部署 | GitHub Actions → GitHub Pages |

### 目录约定

```
_posts/            已发布的文章（按 分类/子主题 分目录）
  ├── _template.md 写新文章的模板（下划线开头，不会被当作文章渲染）
  └── <分类>/      按主题归档，如 algorithm/VLA、pmp
assets/resources/  参考资料归档（电子书、面试题、手册等 PDF/docx）
images/posts/      文章配图，按 分类/ 命名的子目录存放
_data/             skills.yml、social.yml 等结构化数据（关于页/侧栏）
_includes/         页面片段（header、footer、侧边栏等）
_layouts/          布局模板（post、page、default、mindmap 等）
pages/             顶层页面（about、categories、archives、links、open-source）
_config.yml        站点主配置（标题、URL、导航、评论、搜索等）
```

### 本地预览

> 需要 Ruby 3.1。Windows 推荐用 [RubyInstaller](https://rubyinstaller.org/) 安装，并勾选添加到 PATH。

```bash
# 1. 进入项目根目录
cd myNote

# 2. 安装 Bundler（仅首次需要）
gem install bundler

# 3. 安装依赖（读取 Gemfile）
bundle install

# 4. 启动本地预览服务（默认 http://127.0.0.1:4000）
bundle exec jekyll serve

# 想让修改自动刷新，加 --livereload
bundle exec jekyll serve --livereload
```

如果遇到 `webrick` 报错，确认 `Gemfile` 里已包含 `gem "webrick"`（本仓库已包含）。

### 写一篇新文章

1. 复制模板：`cp _posts/_template.md "_posts/$(date +%Y-%m-%d)-<分类>-<标题>.md"`（命名规范为 `YYYY-MM-DD-标题.md`，Jekyll 会据此解析日期与 URL）。
2. 编辑 front matter（`title` / `categories` / `description` / `keywords`），正文使用 Markdown。
3. 配图放至 `images/posts/<分类>/`，在正文中以 `/images/posts/<分类>/xxx.png` 绝对路径引用。
4. 本地预览确认无误后提交，推送即自动部署。

可选增强组件按需在 front matter 中开启：`mermaid`、`sequence`、`flow`（流程图）、`mathjax`（公式）、`mindmap`/`mindmap2`（思维导图）。

### 部署到 GitHub Pages

仓库已配置 `.github/workflows/jekyll.yml`，**推送到 `master` 分支即自动构建并发布**，无需手动操作。部署流程：

1. 代码推送到 `master` 分支。
2. GitHub Actions 自动运行 `bundle install` + `jekyll build`。
3. 产物上传到 Pages，几分钟内站点更新。

前提：仓库 **Settings → Pages → Source** 设为 **GitHub Actions**（而非 branch）。

### 常用配置修改（`_config.yml`）

| 想改什么 | 改哪里 |
| --- | --- |
| 站点标题/副标题/描述 | `title` / `subtitle` / `description` |
| 站点 URL | `url`（当前为 `https://Loren3Ben.github.io`） |
| 导航栏菜单 | `navs` 列表 |
| 评论系统 | `comments_provider`（及对应 provider 的配置块） |
| 字数统计/二维码/分享 | `components` 下各项 `enabled` |
| 代码高亮主题 | `highlight_theme`（主题列表见 [rouge-themes](https://github.com/mzlogin/rouge-themes)） |

### 参考文档

- [本博客模板常见问题 Q & A](https://mazhuang.org/2020/05/03/blog-template-qna/)
- [Setting up your Pages site locally with Jekyll][2]
- [Jekyll 官方文档](https://jekyllrb.com/docs/)
- [GitHub Pages 文档](https://docs.github.com/pages)

## 经验与思考

* 排版建议遵照一定的规范，推荐 [中文文案排版指北（简体中文版）][1]。

* 简约，尽量每个页面都不展示多余的内容。

* 有时一图抵千言，有时可能只会拖慢网页加载速度。

* 言之有物，不做无痛之呻吟。

* 如果写技术文章，那先将技术原理完全理清了再开始写，一边摸索技术一边组织文章效率较低。

* 杜绝难断句、难理解的长句子，如果不能将其拆分成几个简洁的短句，说明脑中的理解并不清晰。

* 可以学习一下那些高质量的博主，他们的行文，内容组织方式，有什么值得借鉴的地方。

## 联系我

如果对本博客模板或者内容有任何建议，可以通过 [Issues](https://github.com/mzlogin/mzlogin.github.io/issues) 或者微信公众号「闷骚的程序员」与我取得联系。

<img width="192px" height="192px" src="https://mazhuang.org/assets/images/qrcode.jpg"/>

## 致谢

本博客外观基于 [DONGChuan](https://dongchuan.github.io) 修改，感谢！

[1]: https://github.com/mzlogin/chinese-copywriting-guidelines
[2]: https://help.github.com/articles/setting-up-your-pages-site-locally-with-jekyll/
[3]: https://github.com/mzlogin/mzlogin.github.io/issues/2
