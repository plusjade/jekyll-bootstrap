---
layout : post
categories : helpers
---

The pages list helper provides a convenient way to list pages.
The pages list helper follows the [Jekyll-bootstrap include helper](/lessons/bootstrap-api.html) strategy.

## Usage

### List All Pages

{% capture text %}<ul>
  |.% assign pages_list = site.pages %.|
  |.% include helpers/pages_list.html %.|
</ul>{% endcapture %}
{% include helpers/liquid_raw.html %}

### List Pages From a Sub-Group

Pages cannot have categories. However we can setup a similar functionality
by manually associating a page to a "group". Do this in the page's yaml front matter:

    ---
    layout: default
    title: A Nice Title
    group: project
    ---

You then pass the group name to the pages\_list helper:

{% capture text %}<ul>
  |.% assign pages_list = site.pages %.|
  |.% assign group = 'project' %.|
  |.% include helpers/pages_list.html %.|
</ul>{% endcapture %}
{% include helpers/liquid_raw.html %}

## Source

The source code is available at:
    
    ./_includes/helpers/pages_list.html
