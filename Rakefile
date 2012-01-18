require "rubygems"
require 'rake'

SOURCE = "."
CONFIG = {
  'themes' => File.join(SOURCE, "_includes", "themes"),
  'layouts' => File.join(SOURCE, "_layouts"),
  'posts' => File.join(SOURCE, "_posts"),
  'post_ext' => "md"
}

# usage rake new_post[my-new-post] or rake new_post['my new post'] or rake new_post (defaults to "new-post")
desc "Begin a new post in #{CONFIG['posts']}"
task :new_post, :title do |t, args|
  abort("rake aborted: '#{CONFIG['posts']}' directory not found.") unless FileTest.directory?(CONFIG['posts'])
  args.with_defaults(:title => 'new-post')
  slug = args.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = File.join(CONFIG['posts'], "#{Time.now.strftime('%Y-%m-%d')}-#{slug}.#{CONFIG['post_ext']}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{args.title.gsub(/-/,' ')}\""
    post.puts "comments: true"
    post.puts "category: "
    post.puts "tags: []"
    post.puts "---"
  end
end # task :new_post

desc "Switch between Jekyll-bootstrap themes."
task :switch_theme, :theme do |t, args|
  theme_path = File.join(CONFIG['themes'], args.theme)
  
  abort("rake aborted: '#{CONFIG['themes']}/#{args.theme}' directory not found.") unless FileTest.directory?(theme_path)
  abort("rake aborted: '#{CONFIG['layouts']}' directory not found.") unless FileTest.directory?(CONFIG['layouts'])
  
  Dir.glob("#{theme_path}/*") do |filename|
    puts "Generating '#{args.theme}' layout: #{File.basename(filename)}"
    
    open(File.join(CONFIG['layouts'], File.basename(filename)), 'w') do |page|
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
end # task :preview

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