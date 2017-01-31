---
layout: post
category : lessons
tagline: "Supporting tagline"
tags : [jekyll, tutorial, liquid, templating]
---
{% include JB/setup %}

## Using Liquid for Templating

Templating is perhaps the most confusing and frustrating part of Jekyll.
This is mainly due to the fact that Jekyll templates must use the Liquid Templating Language.

### What is Liquid?

[Liquid](https://github.com/Shopify/liquid) is a secure templating language developed by [Shopify](http://shopify.com).
Liquid is designed for end-users to be able to execute logic within template files
without imposing any security risk on the hosting server.

Jekyll uses Liquid to generate the post content within the final page layout structure and as the primary interface for working with
your site and post/page data.

### Why Do We Have to Use Liquid?

GitHub uses Jekyll to power [GitHub Pages](http://pages.github.com/).
GitHub cannot afford to run arbitrary code on their servers so they lock developers down via Liquid.

### Liquid is Not Programmer-Friendly.

The short story is liquid is not real code and its not intended to execute real code.
The point being you can't do jackshit in liquid that hasn't been allowed explicitly by the implementation.
What's more you can only access data-structures that have been explicitly passed to the template.

In Jekyll's case it is not possible to alter what is passed to Liquid without hacking the gem or running custom plugins.
Both of which cannot be supported by GitHub Pages.

As a programmer - this is very frustrating.

But rather than look a gift horse in the mouth we are going to
suck it up and view it as an opportunity to work around limitations and adopt client-side solutions when possible.

**Aside**
My personal stance is to not invest time trying to hack liquid. It's really unnecessary
_from a programmer's_ perspective. That is to say if you have the ability to run custom plugins (i.e. run arbitrary ruby code)
you are better off sticking with ruby. Toward that end I've built [Mustache-with-Jekyll](http://github.com/plusjade/mustache-with-jekyll)

**Additional Aside Regarding GitHub**
If you are hosting your blog on github, you will not be able to use any Ruby pluggins. In this instance it *may* be worth writing liquid code, but only if it is for something not easily scriptable with Javascript. An example of this is the tag cloud helper. As we want to total up all of the post tags, it makes sense to do this at Jekyll parse time.

Here is some information on [available liquid filters](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers).

###Escaping Liquid Tags

If you want to post a sample of Liquid code (or have liquid ignore a block for any reason), use "Raw" tags. For example:

{% raw %}
  <code>\{% raw %\}
    {% comment %}
    This is a comment 
    {% endcomment %}
  \{% endraw %\}</code>
{% endraw %}

To escape individual liquid tags, you can use a backslash (\\) in front of each bracket.

I've found that including javascript in your posts sometimes requires the use of raw tags above and below the script block - otherwise the parser may fall over.
