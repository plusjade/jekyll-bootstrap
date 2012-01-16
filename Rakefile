require "rubygems"
require 'rake'

## -- Misc Configs --##
jekyll_dir    = "."
posts_dir      = "_posts"
new_post_ext   = "md"

# usage rake new_post[my-new-post] or rake new_post['my new post'] or rake new_post (defaults to "new-post")
desc "Begin a new post in #{jekyll_dir}/#{posts_dir}"
task :new_post, :title do |t, args|
  raise "### Cannot locate the #{posts_dir}." unless File.directory?(posts_dir)
  mkdir_p "#{jekyll_dir}/#{posts_dir}"
  args.with_defaults(:title => 'new-post')
  slug = args.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  title = args.title.gsub(/-/,' ')
  filename = "#{jekyll_dir}/#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{slug}.#{new_post_ext}"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title}\""
    post.puts "comments: true"
    post.puts "category: "
    post.puts "tags: []"
    post.puts "---"
  end
end

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

desc "Switch between Jekyll-bootstrap themes."
task :switch_theme, :theme do |t, args|
  theme_path = File.join(File.dirname(__FILE__), "_includes", "themes", args.theme)
  layouts_path = File.join(File.dirname(__FILE__), "_layouts")
  
  abort("rake aborted: './_includes/themes/#{args.theme}' directory not found.") unless Dir.exists?(theme_path)
  abort("rake aborted: './_layouts' directory not found.") unless Dir.exists?(layouts_path)
  
  Dir.glob("#{theme_path}/*") do |filename|
    puts "Generating '#{args.theme}' layout: #{File.basename(filename)}"
    
    open("#{layouts_path}/#{File.basename(filename)}", 'w') do |page|
      if File.basename(filename, ".html").downcase == "default"
        page.puts "---"
        page.puts "---"
        page.puts "{% assign theme_asset_path = \"/assets/themes/#{args.theme}\" %}"
      else
        page.puts "---"
        page.puts "layout: default"
        page.puts "---"
      end 
      page.puts "{% include themes/#{args.theme}/#{File.basename(filename)} %}" 
    end
  end
end # task :switch_theme

desc "Launch preview environment"
task :preview do
  system "jekyll --auto --server"
end
