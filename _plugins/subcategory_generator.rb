# _plugins/subcategory_generator.rb
# 子分类生成器插件

module Jekyll
  class SubcategoryPage < Page
    def initialize(site, base, dir, subcategory, posts)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'subcategory.html')
      
      self.data['subcategory'] = subcategory
      self.data['posts'] = posts
      self.data['title'] = "#{subcategory} - #{site.config['title']}"
    end
  end

  class SubcategoryGenerator < Generator
    safe true

    def generate(site)
      # 获取所有带子分类的文章
      subcategory_posts = {}
      
      site.posts.docs.each do |post|
        categories = post.data['categories']
        next unless categories && categories.is_a?(Array) && categories.length > 1
        
        main_category = categories[0]
        sub_category = categories[1]
        
        key = "#{main_category}/#{sub_category}"
        subcategory_posts[key] ||= []
        subcategory_posts[key] << post
      end
      
      # 为每个子分类生成页面
      subcategory_posts.each do |key, posts|
        main_category, sub_category = key.split('/', 2)
        dir = File.join(main_category, sub_category)
        site.pages << SubcategoryPage.new(site, site.source, dir, sub_category, posts)
      end
    end
  end
end