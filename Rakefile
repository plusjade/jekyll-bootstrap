require "rubygems"
require 'rake'
require 'yaml'

SOURCE = "."
CONFIG = {
  'themes' => File.join(SOURCE, "_includes", "themes"),
  'layouts' => File.join(SOURCE, "_layouts"),
  'posts' => File.join(SOURCE, "_posts"),
  'post_ext' => "md",
  'theme_package_version' => "0.1.0"
}

# Path configuration helper
module JB
  class Path
    SOURCE = "."
    Paths = {
      :layouts => "_layouts",
      :themes => "_includes/themes",
      :theme_assets => "assets/themes",
      :theme_packages => "_theme_packages",
      :posts => "_posts"
    }
    
    def self.base
      SOURCE
    end

    # build a path relative to configured path settings.
    def self.build(path, opts = {})
      opts[:root] ||= SOURCE
      path = "#{opts[:root]}/#{Paths[path.to_sym]}/#{opts[:node]}".split("/")
      path.compact!
      File.__send__ :join, path
    end
  
  end #Path
end #JB

# Usage: rake post title="A Title"
desc "Begin a new post in #{CONFIG['posts']}"
task :post do
  abort("rake aborted: '#{CONFIG['posts']}' directory not found.") unless FileTest.directory?(CONFIG['posts'])
  title = ENV["title"] || "new-post"
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = File.join(CONFIG['posts'], "#{Time.now.strftime('%Y-%m-%d')}-#{slug}.#{CONFIG['post_ext']}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/-/,' ')}\""
    post.puts "category: "
    post.puts "tags: []"
    post.puts "---"
    post.puts "{% include JB/setup %}"
  end
end # task :post

# Usage: rake page name="about.html"
# You can also specify a sub-directory path.
# If you don't specify a file extention we create an index.html at the path specified
desc "Create a new page."
task :page do
  name = ENV["name"] || "new-page.md"
  filename = File.join(SOURCE, "#{name}")
  filename = File.join(filename, "index.html") if File.extname(filename) == ""
  title = File.basename(filename, File.extname(filename)).gsub(/[\W\_]/, " ").gsub(/\b\w/){$&.upcase}
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  
  mkdir_p File.dirname(filename)
  puts "Creating new page: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: page"
    post.puts "title: \"#{title}\""
    post.puts "---"
    post.puts "{% include JB/setup %}"
  end
end # task :page

desc "Switch between Jekyll-bootstrap themes."
task :switch_theme do
  theme_name = ENV["name"].to_s
  theme_path = File.join(CONFIG['themes'], theme_name)
  settings_file = File.join(theme_path, "settings.yml")
  non_layout_files = ["settings.yml"]
  
  abort("rake aborted: name cannot be blank") if theme_name.empty?
  abort("rake aborted: '#{theme_path}' directory not found.") unless FileTest.directory?(theme_path)
  abort("rake aborted: '#{CONFIG['layouts']}' directory not found.") unless FileTest.directory?(CONFIG['layouts'])
  
  Dir.glob("#{theme_path}/*") do |filename|
    next if non_layout_files.include?(File.basename(filename).downcase)
    puts "Generating '#{theme_name}' layout: #{File.basename(filename)}"
    
    open(File.join(CONFIG['layouts'], File.basename(filename)), 'w') do |page|
      if File.basename(filename, ".html").downcase == "default"
        page.puts "---"
        page.puts File.read(settings_file) if File.exist?(settings_file)
        page.puts "---"
      else
        page.puts "---"
        page.puts "layout: default"
        page.puts "---"
      end 
      page.puts "{% include JB/setup %}"
      page.puts "{% include themes/#{theme_name}/#{File.basename(filename)} %}" 
    end
  end
end # task :switch_theme

desc "Launch preview environment"
task :preview do
  system "jekyll --auto --server"
end # task :preview

namespace :theme do
  
  # 0.1.0 version of theme install will be simple 1:1 file matching.
  desc "Install theme"
  task :install do
    name = ENV["name"].to_s.downcase
    packaged_theme_path = JB::Path.build(:theme_packages, :node => name)

    abort("rake aborted: name cannot be blank") if name.empty?
    abort("rake aborted: '#{packaged_theme_path}' directory not found.") unless FileTest.directory?(packaged_theme_path)
    
    # Get relative paths to packaged theme files
    packaged_theme_files = []
    FileUtils.cd(packaged_theme_path) { packaged_theme_files += Dir["**/*.*"] }
    # Don't install metadata files.
    packaged_theme_files.delete_if { |f| f =~ /^(manifest|readme|packager)/i }
    
    # Mirror each file into the framework making sure to prompt if already exists.
    packaged_theme_files.each do |filename|
      file_install_path = File.join(JB::Path.base, filename)
      if File.exist? file_install_path
        next if ask("#{file_install_path} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
      else
        mkdir_p File.dirname(file_install_path)
        cp_r File.join(packaged_theme_path, filename), file_install_path
      end
    end
    
    puts "=> #{name} theme has been installed!"
    puts "=> ---"
    if ask("=> Want to switch themes now?", ['y', 'n']) == 'y'
      system("rake switch_theme name='#{name}'")
    end
  end
  
  # The 0.1.0 version of theme packaging will be simple 1:1 file matching.
  # The theme repo will outline it's files in the same structure 
  # it expects to be included into the Jekyll structure.
  desc "Package theme"
  task :package do
    name = ENV["name"].to_s.downcase
    theme_path = JB::Path.build(:themes, :node => name)
    asset_path = JB::Path.build(:theme_assets, :node => name)

    abort("rake aborted: name cannot be blank") if name.empty?
    abort("rake aborted: '#{theme_path}' directory not found.") unless FileTest.directory?(theme_path)
    abort("rake aborted: '#{asset_path}' directory not found.") unless FileTest.directory?(asset_path)
    
    ## Mirror theme's template directory (_includes)
    packaged_theme_path = JB::Path.build(:themes, :root => JB::Path.build(:theme_packages, :node => name))
    mkdir_p packaged_theme_path
    cp_r theme_path, packaged_theme_path
    
    ## Mirror theme's asset directory
    packaged_theme_assets_path = JB::Path.build(:theme_assets, :root => JB::Path.build(:theme_packages, :node => name))
    mkdir_p packaged_theme_assets_path
    cp_r asset_path, packaged_theme_assets_path

    ## Log packager version
    packager = {"packager" => {"version" => CONFIG["theme_package_version"].to_s } }
    open(JB::Path.build(:theme_packages, :node => "#{name}/packager.yml"), "w") do |page|
      page.puts packager.to_yaml
    end
    
    puts "=> '#{name}' theme is packaged and available at: #{JB::Path.build(:theme_packages, :node => name)}"
  end
  
end # end namespace :theme


def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end