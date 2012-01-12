---
layout : post
categories : helpers
---

The posts collate helper organizes and lists posts in month/year clusters.
The posts collate helper follows the [Jekyll-bootstrap include helper](/api/bootstrap-api.html) strategy.

## Usage

### Collate All Posts in Reverse Chronological Order

By default all posts are organized in reverse-chronological order - newest to oldest.

{% capture text %}|.% assign posts_collate = site.posts %.|
|.% include helpers/posts_collate.html %.|{% endcapture %}
{% include helpers/liquid_raw.html %}


### Collate a Sub-Set of Posts

To collate a sub-set of posts, just pass in the sub-set.
Bellow, only posts tagged "jekyll" will be collated:

{% capture text %}|.% assign posts_collate = site.tags.jekyll %.|
|.% include helpers/posts_collate.html %.|{% endcapture %}
{% include helpers/liquid_raw.html %}


## Source

The source code is available at:
    
    ./_includes/helpers/posts_collate.html
