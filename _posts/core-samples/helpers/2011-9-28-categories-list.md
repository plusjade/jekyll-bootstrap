---
layout : post
categories : helpers
---

The categories list helper provides a convenient way to list categories.
The categories list helper follows the [Jekyll-bootstrap include helper](/lessons/bootstrap-api.html) strategy.

## Usage

### List Sitewide Categories

List site-wide categories by passing in the `site.categories` variable:

{% capture text %}<ul>
  |.% assign categories_list = site.categories %.|
  |.% include helpers/categories_list.html %.|
</ul>{% endcapture %}
{% include helpers/liquid_raw.html %}

### List Categories for a Specific Post

You can also list categories specific to a post:

{% capture text %}<ul>
  |.% assign categories_list = page.categories %.|
  |.% include helpers/categories_list.html %.|
</ul>{% endcapture %}
{% include helpers/liquid_raw.html %}

### List Categories Per Post Iteratively

Finally let's iterate through all posts:

{% capture text %}|.% for post in site.posts %.|
  <h3>Categories for: |.{post.title}.|</h3>  
  <ul>
    |.% assign categories_list = post.categories %.|  
    |.% include helpers/categories_list.html %.|
  </ul>
|.% endfor %.|{% endcapture %}
{% include helpers/liquid_raw.html %}


## Source

The source code is available at:
    
    ./_includes/helpers/categories_list.html