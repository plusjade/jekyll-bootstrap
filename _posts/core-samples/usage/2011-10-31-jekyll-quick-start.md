---
layout: post
categories : usage
---


## 1. Install Jekyll-Bootstrap

[Install Jekyll-Bootsrap](/index.html#start-now) if you haven't already.
Jekyll-bootstrap is a clean base framework for your blog.
It includes two themes, some useful pages, and bootstrap include-helpers.

## 2. Run Jekyll Locally

In order to preview your blog locally you'll need to install the jekyll gem. Note gem dependencies will also be installed.

    $ gem install jekyll

If you run into a problem please consult the original [Jekyll installation documentation](https://github.com/mojombo/jekyll/wiki/Install).
You can also [contact me](http://github.com/plusjade) through github.

Once the gem is installed you can navigate to your Jekyll-bootstrap directory
and run jekyll:

    $ cd jekyll-bootstrap
    $ jekyll --server

Your blog is now available at: [http://localhost:4000/](http://localhost:4000/).


## 2. Choose a Theme

Jekyll-bootstrap has a basic theming system that I'll be steadily improving.
You can read about how to choose and customize a theme in the [Theming](/usages/theming.html) section.

## 3. Create Some Content

### Create a Post

Create a file with valid date and title in the filename and place it into the `_posts` folder.
Jekyll-bootstrap provides many post files for you to copy from to better understand the formatting requirements.

### Create a Page

Create a file anywhere in the root directory, for example `/about.md` and remember to provide
valid YAML Front Matter so Jekyll recognizes the file as a page.

Jekyll-bootstrap provides many page examples for reference. 
You can study the source and customize it for your own needs.

<ul>
{% assign pages_list = site.pages %}
{% include helpers/pages_list.html %}
</ul>


## 4. Publish

After you've added posts or made changes to your theme or other files, simply commit them to your git repo and push the commits up to GitHub.

A GitHub post-commit hook will automatically deploy your changes to your hosted blog. You will receive a success or failure notice for every commit you make to your blog.

## 5. Customize

Jekyll-bootstrap can be used as-is as a basic blogging platform with little need
to understand what's going on under the hood.

However I'm betting you want to get your hands dirty. 
The following outlines the deeper Jekyll-Bootstrap documentation.

### Jekyll Introduction

The [{{site.categories.lessons.first.title}}]({{site.categories.lessons.first.url}})  is meant for core understanding of how and why Jekyll works the way it does.
You must start with this in order to understand everything else in Jekyll-Bootstrap.

### The API Section 

The API pages document main data-structures and design strategies used in Jekyll and Jekyll-Bootstrap.


