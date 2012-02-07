---
layout: splash
title: "Developer Documentation &amp; Community"
---
{% include JB/setup %}

## 1 - Learn Jekyll

<ul class="thumbnails">
  {% assign pages_icons = site.tags.learn %}
  {% include pages_icons %}
</ul>

## 2 - Learn Jekyll Bootstrap

<ul class="thumbnails">
  {% assign pages_icons = site.tags.jb %}  
  {% include pages_icons %}
</ul>

## 3 - Contribute

<div class="row">
  <div class="span6">
    <h3>Community</h3>
    <p>
      Please help spread the word about Jekyll Bootstrap.
      Also your usage feedback is very much needed and appreciated.
    </p>
    
    <h3>Themes</h3>
    <p>
      Please consult the Theme API section to learn how to create and update themes.
    </p>
    <p>
      Themes are tracked and published on the GitHub <a href="https://github.com/jekyllbootstrap">Jekyll-Bootstrap Project Page</a>.
      To update an existing theme please send pull requests to the theme's repository.
    </p>

    <h3>Javascript Plugins</h3>
    <p>
      If you are good at javascript we can work together to figure out a definitive client-side plugin strategy for Jekyll.
      This is really important because since GitHub pages can't support liquid/jekyll plugins, we can still code robust 
      functionality via javascript.
    </p>
    
    <h3>Core Jekyll/Liquid API</h3>
    <p>
      This is the core JB framework which interacts with Liquid and Jekyll.
      If you are good at ruby and/or Liquid, consider improving the rake tasks or JB helpers.
    </p>
    
    <h3>Documentation</h3>
    <p>More content, tutorials information is welcome. You can also proofread existing materials.</p>
  </div>
  <div class="span5 offset1">
    <h3>How</h3>
    <p><a href="https://github.com/plusjade/jekyll-bootstrap">Jekyll Bootstrap is on GitHub</a>.</p>
    <p><strong>Send pull requests</strong> as outlined in the main <a href="https://github.com/plusjade/jekyll-bootstrap#readme">README file</a>.</p>
    <p><strong>Features, bugs, and questions</strong> should be entered as <a href="https://github.com/plusjade/jekyll-bootstrap/issues">GitHub Issues</a>.</p>
    
    <h3>Why</h3>
    <p>
      Jekyll Bootstrap's <em>technical</em> objective
      is to create a standardized, well-tuned API for creating and maintaining Jekyll-powered blogs.
      This will provide users with an easy way to contribute their work to a growing community.
    </p>
    <p>
      If you are interested in making technical blogging better, not only for yourself, but for others around the world,
      consider contributing to Jekyll Bootstrap - we are glad to have you!
    </p>

    <h3>License</h3>
    <p>
      <a href="http://unlicense.org/">Unlicense</a> - Jekyll Bootstrap is released into the Public Domain. 
    </p>
    <p>
      It should also be noted that by willingly submitting any updates to the project,
      you are accepting the Unlicensing Policy and setting your code Free into the Public Domain =)
    </p>    
    <p>Thank you.</p>
  </div>
</div>