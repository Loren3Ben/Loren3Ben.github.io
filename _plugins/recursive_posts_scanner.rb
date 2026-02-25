# _plugins/recursive_posts_scanner.rb
Jekyll::Hooks.register :site, :after_init do |site|
  # 定义要扫描的根目录
  root_dir = File.join(site.source, "_posts", "algorithm")

  # 递归查找所有 .md 文件
  Dir.glob(File.join(root_dir, "**", "*.md")).each do |file|
    next if File.directory?(file) # 跳过目录

    # 获取相对路径（相对于 source 目录）
    relative_path = Pathname.new(file).relative_path_from(Pathname.new(site.source))

    # 注册文件为 Jekyll 文档
    site.reader.read_directories(relative_path.dirname)
  end
end