---
layout: page
title: "Test"
---
{% include JB/setup %}

<link rel="stylesheet" href="https://raw.github.com/gist/1573884/20e3a35852c1c14f41d5371c85269cf0fd59dbeb/pygments.css" type="text/css" media="screen" title="no title" charset="utf-8"/>

## Testing code-highlighting

{% highlight ruby linenos %}

    site = {
      "related_posts"=>
        [...(Array of liquified Jekyll::Post objects)...],
     "safe"=>false,
     "auto"=>true,
     "server"=>true,
     "server_port"=>4000,
     "source"=>"/Users/jade/Dropbox/github/jekyll-bootstrap",
     "destination"=>"/Users/jade/Dropbox/github/jekyll-bootstrap/_site",
     "plugins"=>"/Users/jade/Dropbox/github/jekyll-bootstrap/_plugins",
     "future"=>true,
     "lsi"=>false,
     "pygments"=>false,
     "markdown"=>"maruku",
     "permalink"=>"/:categories/:title.html",
     "markdown_ext"=>"markdown,mkd,mkdn,md",
     "textile_ext"=>"textile",
     "maruku"=>
      {
       "use_tex"=>false,
       "use_divs"=>false,
       "png_engine"=>"blahtex",
       "png_dir"=>"images/latex",
       "png_url"=>"/images/latex"
      },
     "rdiscount"=>
      {
        "extensions"=>[]
      },
     "redcarpet"=>
      {
        "extensions"=>[]
      },
     "kramdown"=>
      {
       "auto_ids"=>true,
       "footnote_nr"=>1,
       "entity_output"=>"as_char",
       "toc_levels"=>"1..6",
       "use_coderay"=>false,
       "coderay"=>
        {
         "coderay_wrap"=>"div",
         "coderay_line_numbers"=>"inline",
         "coderay_line_number_start"=>1,
         "coderay_tab_width"=>4,
         "coderay_bold_every"=>10,
         "coderay_css"=>"style"
        }
      },
     "time"=>2011-12-20 14:03:53 -0800,
     "posts"=>
      [...(Array of liquified Jekyll::Post objects)...],
     "pages"=>
      [...(Array of liquified Jekyll::Page objects)...],
     "html_pages"=>
      [...(Array of liquified Jekyll::Page objects)...],
     "categories"=>
      {"examples"=>
        [...(Array of liquified Jekyll::Post objects)...],
       "lessons"=>
        [...(Array of liquified Jekyll::Post objects)...],
     "tags"=>
      {
       "permalinks"=>
        [...(Array of liquified Jekyll::Post objects)...],
       "urls"=>
        [...(Array of liquified Jekyll::Post objects)...],
       "templating"=>
        [...(Array of liquified Jekyll::Post objects)...],
       "liquid"=>
        [...(Array of liquified Jekyll::Post objects)...],
       "posts"=>
        [...(Array of liquified Jekyll::Post objects)...]
      }
    }

{% endhighlight %}