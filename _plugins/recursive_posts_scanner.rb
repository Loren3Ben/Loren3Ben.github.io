# _plugins/recursive_posts_scanner.rb
Jekyll::Hooks.register :site, :after_init do |site|
  # 定义要扫描的根目录
  root_dir = File.join(site.source, "_posts", "**")

  # 递归查找所有 .md 文件
  Dir.glob(File.join(root_dir, "**", "*.md")).each do |file|
    next if File.directory?(file) # 跳过目录

    # 获取相对路径（相对于 source 目录）
    relative_path = Pathname.new(file).relative_path_from(Pathname.new(site.source))

    # 获取文件所在的目录路径
    dir_path = relative_path.dirname
    
    # 确保该目录被添加到站点的包含路径中
    unless site.include_paths.include?(dir_path.to_s)
      site.include_paths << dir_path.to_s
    end

    # 手动创建文档对象并添加到站点
    begin
      doc = Jekyll::Document.new(
        file,
        site: site,
        collection: site.collections["posts"]
      )
      doc.read
      site.collections["posts"].docs << doc
    rescue => e
      puts "警告: 无法处理文件 #{file}: #{e.message}"
    end
  end
end