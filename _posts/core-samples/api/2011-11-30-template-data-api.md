---
layout : post
categories : api
tags : [templating, liquid]
---

The Template data API is a comprehensive list of all data accessible in templates through using the Liquid templating language.
The next lesson will focus on [accessing Jekyll data via Liquid]({{page.previous.url}})

## Global Page/Post Data

Every content file that Jekyll processes is either a page or a post.
In both cases the data relative to the specific page or post being rendered
within the template is accessible through the `page` variable.
The page variable is a globally accessible variable available to all templates, posts, pages, and includes being rendered
for the given post/page instance.

    
    /* The following format represents a Jekyll::Post or Jekyll::Page object. Jekyll::Post and Jekyll::Page objects may be nested in other variables in which case you can expect this same format: */
    page = {
     "layout"=>"post",
     "categories"=>["lessons"],
     "title"=>"Jekyll Liquid Api",
     "url"=>"/lessons/jekyll-liquid-api.html",
     "date"=>2011-01-27 00:00:00 -0800,
     "id"=>"/lessons/jekyll-liquid-api",
     "next"=> #Jekyll:Post @id="/lessons/template-data-api",
     "previous"=> #Jekyll:Post @id="/lessons/configuring-urls",
     "tags"=>["tagname1", "tagname2"],
     "custom_variable"=> ["a", "custom", "defined", "data-structure"],
     "content"=>"... this is the unparsed raw html page/post content ..."
    }


### Setting Custom Data

You can set custom variables through the post or page Yaml Front matter and they will be included
in the page hash.

One important thing to note is that each Jekyll "rendering" instance is treating as a page/post object.
ALL YAML Front matter is merged into the current page/post instance.
So if you define custom data in the post file, then define custom data in the sub-template,
and also in the root template, all data will merge into the same page hash.


## Content Data

Jekyll uses a special variable named `content` to refer to the current page/post content.

The difference between  `content` and `page.content` is the former is parsed with markdown or textile while the latter is raw.

The `content` variable is only accessible in template files and include files provided the include is included into a template.

### Content in Primary Templates.

When calling `content` in a primary template the content includes any sub-templates
previously rendered by the page/post.

### Content in Sub-Templates.

When calling `content` in a sub-template `content` includes any sub-sub-templates
previously rendered by the page/post. If there are none, `content` just reflects
the page/post as processed by markdown or textile.

 
## Global Site Data

This data is available anywhere liquid is available. This includes templates, posts, pages, and includes.


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



### Sitewide Custom Data

Set sitewide custom data using the config file.

Variables held in the config file get merged into the site variable.





## Categories

Categories may only be applied to posts and are available on a per-post basis as well as aggregated
in a sitewide global variable, i.e. all categories available for the website.

When iterating over categories the order is alpha descending

## Tags

Tags may only be applied to posts and are available on a per-post basis as well as aggregated
in a sitewide global variable, i.e. all tags available for the website.

When iterating over tags the order is alpha descending.
