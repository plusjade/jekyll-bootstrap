# Usage: rake "flickr[http://flickr.com http://flickr.com]"
# vim: ts=2 sw=2 sts=2

require 'fleakr'

Fleakr.api_key       = ENV["FLICKR_API_KEY"]
Fleakr.shared_secret = ENV["FLICKR_SHARED_SECRET"]

desc "Begin a new photo in #{CONFIG['posts']}"
task :flickr, :urls do |t, args|
  abort("rake aborted: '#{CONFIG['posts']}' directory not found.") unless FileTest.directory?(CONFIG['posts'])

  urls = args[:urls].split
  photos = []
  urls.each_with_index do |url, index|
    photos << Fleakr.resource_from_url(url)
  end

  date = Time.now.strftime('%Y-%m-%d')
  slug = photos[0].title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = File.join(CONFIG['posts'], "#{date}-#{slug}.#{CONFIG['post_ext']}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end

  tags = []
  photos.each do |photo|
      photo.tags.each do |tag|
      tags << tag.value
    end
  end

  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: '#{photos[0].title}'"
    post.puts "description: '#{photos[0].description}'"
    post.puts "tags: [#{tags.uniq.join(', ')}]"
    post.puts "---"
    post.puts "{% include JB/setup %}"

    photos.each do |photo|
      post.puts "<img alt='#{photo.title}' title='#{photo.title}' src='#{photo.large.url}'>"
    end
  end
end
