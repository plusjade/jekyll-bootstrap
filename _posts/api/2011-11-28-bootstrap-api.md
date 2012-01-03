---
layout : post
categories : api
tags : api
---

The Jekyll Bootstrap API consists of custom includes and development
strategies meant to provide a more modular and sensible coding experience
when working with Liquid and Jekyll.

## Philosophy

Jekyll-bootstrap uses an 'include' helper strategy to encapsulate frequently used 
code logic. This makes for more modular and DRY code.

The 'include' helper is the same concept as rails' view helper modules,
just obviously much more constrained due to Liquid.

## Include-helper Strategy

### Define a new "method"

The include helper strategy is meant to emulate a ruby method.
First encapsulate your liquid code logic in a Jekyll include file.   
example: `helpers/tags_list.html` which is a helper to list tags and their total counts. 

{% capture text %}|.% for tag in tags_list %.|
  <li><a href="|.{ site.var.tags_path }.||.{ tag[0] }.|-ref">|.{ tag[0] }.| <span>|.{tag[1].size}.|</span></a></li>
|.% endfor %.|

|.% assign tags_list = null %.|{% endcapture %}    
{% include helpers/liquid_raw.html %}

In order to emulate passing arguments to the method, your include should reference localized variables whenever possible.
Now we can pass in arguments by defining the local variables immediately before calling the include file:

### Invoking the Method.

{% capture text %}<ul>
  |.% assign tags_list = site.tags %.|
  |.% include helpers/tags_list.html %.|
</ul>{% endcapture %}
{% include helpers/liquid_raw.html %}

You can define as many "arguments" as you want, just remember to nullify them all at the end of your include to preserve modularity.

### Gotchas

In Liquid, it is impossible to inline assign a variable to anything other than a string.
This means you can't pass in arrays, hashes, etc.
However, as shown above, you can pass-by-reference, and assign local variables to variables that already exist.

So to pass in data-structures, you need to define them in your YAML Front Matter, or \_config.html file first, then pass them in by reference.

## Contibuting 

If you have a good idea for another helper, please follow the outlines above,
then submit a pull request to [Jekyll-Bootstrap](http://github.com/plusjade/jekyll-bootstrap) and I'll include it. 

## Current Jekyll-Bootstrap Helpers

<ul>
  {% assign pages_list = site.categories.helpers %}  
  {% include helpers/pages_list.html %}
</ul>
