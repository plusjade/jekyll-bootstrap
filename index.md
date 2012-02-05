---
layout: default
title: Home
head_title: Blogging with Jekyll Tutorial
header: This is Jekyll-Bootstrap
---

<h2 style="margin:20px 0; border:0">
  The Quickest Way to Blog with Jekyll.
</h2>

<div class="highlight-wrap" style="margin-bottom:10px">
  <strong>Jekyll-Bootstrap</strong> is a blogging framework made for developers and designers.
  <br>Create content in markdown or textile and manage everything with git.
  <br>Publish from terminal, no database, no hosting headaches.
</div>

<ul id="tab-list" class="pills">
  <li><a href="#">Themes</a></li>
  <li><a href="#">Comments</a></li>
  <li><a href="#">Posts &amp; Pages</a></li>
  <li><a href="#">Free Hosting</a></li>
  <li><a href="#">Community</a></li>
</ul>
<div id="tab-content-wrapper">
  
  <div>
    <h3>Install and Switch Blog Themes With One Command.</h3>
    <p>
      Jekyll Bootstrap is the first Jekyll blogging engine to support modular theming.
      <br>This makes designing and sharing themes for Jekyll blogs much easier and automatic.
    </p>
    <p style="margin-top:40px">
      <a href="http://themes.jekyllbootstrap.com" class="btn" target="_blank">Browse Current Themes</a> <small>(new window)</small>
    </p>
  </div>

  <div>
    <h3>Support For All Major Blog Comment Engines.</h3>
    <p>Installation is as easy as pasting in your account identifier.</p>
    <ul>
      <li>Disqus</li>
      <li>Livefyre</li>
      <li>Intense Debate</li>
      <li>Facebook</li>
    </ul>
  </div>

  <div>
    <h3>Built-in Post and Page File Creation.</h3>
    <p>
      Easily create post and page file stubs using Jekyll Bootstrap's built in rake tasks.
      <br>Plus dynamically generated page stubs for all these goodies:
    </p>
    <ul>
      <li>archive.html</li>
      <li>pages.html</li>
      <li>tags.html</li>
      <li>categories.html</li>
      <li>sitemap.xml</li>
      <li>atom.xml</li>
    </ul>
  </div>

  <div>
    <h3>Free and Easy Blog Hosting With GitHub Pages.</h3>
    <p>
      Jekyll-bootstrap is 100% compatible with deploying to GitHub.
      <br>Just push your repository to a valid <a href="http://pages.github.com">GitHub Pages</a> endpoint and GitHub hosts your website &lt;3.
    </p>
  </div>

  <div>
    <h3>Blog Your Way to a Better World =)</h3>
    <p>
      Jekyll Bootstrap started as a way to empower more programmers to share their knowledge, advice, and experiences.
       We've grown through embracing Open Source and prolifically refining Jekyll Bootstrap's Public API.
    </p>
    <p>
      <strong>The Result?</strong><br>
      Each new supporter builds a bigger and better community from which we mutually benefit. 
      More and better themes, plugins, javascript goodies, and ultimately more knowledge shared.
    </p>
    <p>
      <strong>- Thank you for investing in our community!</strong>
    </p>
  </div>
</div>

<div style="text-align:center; color:#777">
  New to blogging with Jekyll? <a href="{{ site.categories.lessons.first.url }}" style="text-decoration:underline">Read the introduction</a>.
</div>

<h1 id="start-now">Zero to Hosted Jekyll Blog in 3 Minutes</h1>

<form action="#" id="generate_code" class="alert-message block-message warn" style="margin-left:-40px; text-align:center">
  My GitHub username: <input type="text" id="github_username"/> <button class="btn success">Personalize Install Code</button>
</form>

### 1 - Create a New Repository

Go to your [Github Dashboard](https://github.com/) and create a new repository named <strong id="repo_name">USERNAME.github.com</strong>

### 2 - Install Jekyll-Bootstrap

{% highlight bash linenos %}
$ git clone https://github.com/plusjade/jekyll-bootstrap.git USERNAME.github.com
$ cd USERNAME.github.com
$ git remote set-url origin git@github.com:USERNAME/USERNAME.github.com.git
$ git push origin master
{% endhighlight %}

### 3 - Profit

After GitHub has a couple minutes to do its magic your blog will be publicly available at 
<a href="http://USERNAME.github.com" id="blog_link">http://USERNAME.github.com</a>

### \*Already have your blog on GitHub?

I'll assume you have the Jekyll gem installed on your local machine.
Run Jekyll-Bootstrap-Core locally to see what all the fuss is about:

{% highlight bash linenos %}
$ git clone https://github.com/plusjade/jekyll-bootstrap.git
$ cd jekyll-bootstrap
$ jekyll --server
{% endhighlight %}

See it in action at [http://localhost:4000](http://localhost:4000).

## Next Steps

<ul class="pills">
  <li><a href="http://github.com/plusjade/jekyll-bootstrap" class="">Watch Jekyll Bootstrap on GitHub, then ...</a></li>
	<li class="active"><a href="{{ BASE_PATH }}{{ site.categories.usage.first.url }}">{{ site.categories.usage.first.title }} &rarr;</a></li>
</ul>
