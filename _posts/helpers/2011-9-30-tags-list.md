---
layout : post
categories : helpers
---

The tag list helper lists tags and their total counts.   
The tag list helper follows the [Jekyll-bootstrap include helper](/lessons/bootstrap-api.html) strategy.

## Usage

### List Sitewide Tags

You can list sitewide tags by passing in the `site.tags` variable:

{% capture text %}<ul>
  |.% assign tags_list = site.tags %.|
  |.% include helpers/tags_list.html %.|
</ul>{% endcapture %}
{% include helpers/liquid_raw.html %}

### List Tags for a Specific Post

You can also list tags specific to a post:

{% capture text %}<ul>
  |.% assign tags_list = page.tags %.|
  |.% include helpers/tags_list.html %.|
</ul>{% endcapture %}
{% include helpers/liquid_raw.html %}

### List Tags Per Post Iteratively

Finally let's iterate through all posts:

{% capture text %}|.% for post in site.posts %.|
  <h3>Tags for: |.{post.title}.|</h3>  
  <ul>
    |.% assign tags_list = post.tags %.|  
    |.% include helpers/tags_list.html %.|
  </ul>
|.% endfor %.|{% endcapture %}
{% include helpers/liquid_raw.html %}

## Source

The source code is available at:
    
    ./_includes/helpers/tags_list.html
    

