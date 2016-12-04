---
layout: post
category : lessons
tagline: "Supporting tagline"
tags : [intro, beginner, jekyll, tutorial]
---
{% include JB/setup %}

## Templates in Jekyll

Templates are used to contain a page's or post's content.
All templates have access to a global site object variable: `site` as well as a page object variable: `page`.
The site variable holds all accessible content and metadata relative to the site.
The page variable holds accessible data for the given page or post being rendered at that point.

**Create a Template**
Templates are created by properly formatting a file and placing it in the `_layouts` directory.

**Formatting**
Templates should be coded in HTML and contain YAML Front Matter.
All templates can contain Liquid code to work with your site's data.

**Rending Page/Post Content in a Template**
There is a special variable in all templates named : `content`.
The `content` variable holds the page/post content including any sub-template content previously defined.
Render the content variable wherever you want your main content to be injected into your template:

{% capture text %}...
<body>
  <div id="sidebar"> ... </div>
  <div id="main">
    |.{content}.|
  </div>
</body>
...{% endcapture %}
{% include JB/liquid_raw %}

### Sub-Templates

Sub-templates are exactly templates with the only difference being they
define another "root" layout/template within their YAML Front Matter.
This essentially means a template will render inside of another template.

### Includes
In Jekyll you can define include files by placing them in the `_includes` folder.
Includes are NOT templates, rather they are just code snippets that get included into templates.
In this way, you can treat the code inside includes as if it was native to the parent template.

Any valid template code may be used in includes.