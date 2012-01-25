---
layout: post
categories : usage
---


## 1. Install Jekyll-Bootstrap

[Install Jekyll-Bootsrap](/index.html#start-now) if you haven't already.
Jekyll-bootstrap is a blogging framework with built-in support for theming, analytics, comments, and post/page creation.

## 2. Run Jekyll Locally

In order to preview your blog locally you'll need to install the Jekyll ruby gem. Note gem dependencies will also be installed.
You don't have to run a local version but it helps if you want to preview your content before publishing.

    $ gem install jekyll

If you run into a problem please consult the original [Jekyll installation documentation](https://github.com/mojombo/jekyll/wiki/Install).
You can also [create a support issue](https://github.com/plusjade/jekyll-bootstrap/issues) using GitHub Issues.

Once the gem is installed you can navigate to your Jekyll-Bootstrap directory.
If you've followed the homepage instructions this will be: USERNAME.github.com.
Once in the directory you'll run jekyll with server support:

    $ cd USERNAME.github.com 
    $ jekyll --server
    
    # remember to change USERNAME to your GitHub username.
    
Your blog is now available at: [http://localhost:4000/](http://localhost:4000/).


## 2. Create a Post

Create posts easily via rake task:

    $ rake post title="Hello World"

The rake task automatically creates a file with properly formatted filename and YAML Front Matter.
Make sure to specify your own title. By default, the date is the current date.

The rake task will never overwrite existing posts unless you tell it to.

## 3. Create a Page

Create pages easily via rake task:

    $ rake page name="about.md"

Create a nested page:
    
    $ rake page name="pages/about.md"

Create a page with a "pretty" path:
  
    $ rake page name="pages/about"
    
    # this will create the file: ./pages/about/index.html
  
The rake task automatically creates a page file with properly formatted filename and YAML Front Matter 
as well as includes the Jekyll Bootstrap "setup" file.

### Jekyll-Bootstrap Example Pages

Jekyll-bootstrap also provides many preconfigured page examples for reference. 
You can study the source and customize it for your own needs.

<ul>
{% assign pages_list = site.pages %}
{% assign group = "example-page" %}
{% include JB/pages_list %}
</ul>

## 4. Publish

After you've added posts or made changes to your theme or other files, simply commit them to your git repo and push the commits up to GitHub.
   
    $ git add .
    $ git commit -m "Add new content"
    $ git push origin master

A GitHub post-commit hook will automatically deploy your changes to your hosted blog. You will receive a success or failure notice for every commit you make to your blog.

## 5. Customize

Jekyll-Bootstrap can be used as-is as a basic blogging platform.  However there are plenty of ways to dig into deeper customization. 
The following outlines deeper Jekyll-Bootstrap customization techniques:

### Themes 

Jekyll-Bootstrap supports modular theming. Themes can co-exist and be enabled/disabled on demand.
Editing, configuring, and creating themes is docummented in the [Theming](/usage/jekyll-theming.html) section.

### Blog Configuration

Jekyll and Jekyll-Bootstrap has a simple but powerful [Jekyll Configuration System](/usage/blog-configuration.html). You can:

- Specify a custom permalink format for blog posts.
- Specify a commenting engine like disqus, intensedebate, livefyre, or custom.
- Specify an analytics engine like google, getclicky, or custom.


### Programming Interface

The API pages document main data-structures and code available for use in Jekyll and Jekyll-Bootstrap.
Consult these pages for how and where to use the data and code provided.

### Jekyll Introduction

<span class="label notice">highly recommend</span>   
I highly recommend reading the [{{site.categories.lessons.first.title}}]({{site.categories.lessons.first.url}}) 
if you plan to customize your blog. The introduction is meant for core understanding of how and why Jekyll works the way it does.
This will provide you with the proper context, knowledge-base, and fundamentals necessary to understand
and be efficient in working with Jekyll and Jekyll-Bootstrap.

