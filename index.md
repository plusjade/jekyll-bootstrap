---
layout: default
title: Home
head_title: Blogging with Jekyll Tutorial
header: This is Jekyll-Bootstrap
---

<h2 style="margin:20px 0; border:0">
  Jekyll-Bootstrap &rarr; <br>
  The Quickest Way to Blog with Jekyll.
</h2>

New to blogging with Jekyll? <a href="{{ site.categories.lessons.first.url }}" style="text-decoration:underline">Read the introduction</a>.

<span class="highlight-wrap">
  Jekyll-Bootstrap ships with a complete pre-built Jekyll directory structure for blogging, 
  <span>modular theming</span>, plug-and-play <span>commenting</span>, <span>analytics</span>, 
  <span>new post and page generators</span>, and coded <span>page-stubs</span> to get you rolling.
</span>

## Core Benefits

- **Convenient Blogging**   
  Without Jekyll-Bootstrap, you'd have to configure _every single page_ of your blog.
  Jekyll-bootstrap takes you from 0 to hosted blog in 3 minutes, really!

- **Free and Easy Hosting via GitHub Pages**  
  Jekyll-bootstrap is 100% compatible with deploying to GitHub.
  Just push your repository to a valid [GitHub Pages](http://pages.github.com) endpoint and GitHub hosts your website &lt;3.  

- **Progressive, Unified Development**  
  Ensuring your Jekyll blog is always compatible with GitHub Pages
  means development can move the most users forward.
  This helps improve the current horizontal and highly segmented Jekyll ecosystem. 
  Look forward to more and better features that simply _drop in_.
  
<h1 id="start-now">Zero to Hosted Jekyll Blog in 3 Minutes</h1>

<form action="#" id="generate_code" class="alert-message block-message warn" style="margin-left:-40px; text-align:center">
  My GitHub username: <input type="text" id="github_username"/> <button class="btn success">Personalize Install Code</button>
</form>

### 1 - Create a New Repository

Go to your [Github Dashboard](https://github.com/) and create a new repository named <strong id="repo_name">USERNAME.github.com</strong>

### 2 - Install Jekyll-Bootstrap

    $ git clone https://github.com/plusjade/jekyll-bootstrap.git USERNAME.github.com
    $ cd USERNAME.github.com
    $ git remote set-url origin git@github.com:USERNAME/USERNAME.github.com.git
    $ git push origin master

### 3 - Profit

After GitHub has a couple minutes to do its magic your blog will be publicly available at 
<a href="http://USERNAME.github.com" id="blog_link">http://USERNAME.github.com</a>

### \*Already have your blog on GitHub?

I'll assume you have the Jekyll gem installed on your local machine.
Run Jekyll-Bootstrap-Core locally to see what all the fuss is about:

    $ git clone https://github.com/plusjade/jekyll-bootstrap.git
    $ cd jekyll-bootstrap
    $ jekyll --server

See it in action at [http://localhost:4000](http://localhost:4000).

## Next Steps

<ul class="pills">
  <li><a href="http://github.com/plusjade/jekyll-bootstrap" class="">Watch Jekyll Bootstrap on GitHub, then ...</a></li>
	<li class="active"><a href="{{ BASE_PATH }}{{ site.categories.usage.first.url }}">{{ site.categories.usage.first.title }} &rarr;</a></li>
</ul>
