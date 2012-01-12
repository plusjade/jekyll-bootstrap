require "rubygems"
require 'rake'

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
