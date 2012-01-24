---
layout: default
title: Home
head_title: Blogging with Jekyll Tutorial
header: This is Jekyll-Bootstrap
---

<p class="alert-message block-message success" style="margin-top:20px; margin-left:-40px">
	<strong>Jekyll Bootstrap</strong> is the quickest way to start and publish your Jekyll powered blog.
  <br>All code is 100% compatible with GitHub pages. 
</p>


## Why Use Jekyll-Bootstrap?

New to blogging with Jekyll? <a href="{{ site.categories.lessons.first.url }}" style="text-decoration:underline">Read the introduction</a>.

**Experienced Jekyll users recommend cloning an existing Jekyll blog** to use as your starting point.
Jekyll-bootstrap takes this advice to the next level by attempting to be the _definitive_ Jekyll-framework to clone.
The framework provides theme integration, code-helpers, and coded page-stubs to get you rolling.

### Core Benefits

- **Convenient**  
  The main drawback to Jekyll _as a publishing platform_ is you have to set everything up yourself.
  Jekyll-bootstrap takes you from 0 to hosted blog in 3 minutes, really!

- **Comprehensive**  
  Jekyll-bootstrap goes beyond documentation and explains how and why jekyll works the way it does,
  empowering you to extend as you fit without the barrier of a high learning curve.

- **Free and Easy Hosting via GitHub Pages**  
  Jekyll-bootstrap is 100% compatible with deploying to GitHub.
  Just push your repository to a valid [GitHub Pages](http://pages.github.com) endpoint and GitHub hosts your website &lt;3.  

- **Progressive, Unified Development**  
  Ensuring your Jekyll blog is always compatible with GitHub Pages
  means development can be built upon in a way that moves the most users forward.
  This helps improve the current horizontal and highly segmented Jekyll ecosystem.
  
<h2 id="start-now">Zero to Hosted Jekyll Blog in 3 Minutes</h2>

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

Please show your support by "watching" [Jekyll-Bootstrap](http://github.com/plusjade/jekyll-bootstrap) on GitHub - Thanks!

Next, the Usage section contains information on pragmatically using your new Jekyll-bootstrap blog.

- [{{site.categories.usage.first.title}}]({{site.categories.usage.first.url}}) 
