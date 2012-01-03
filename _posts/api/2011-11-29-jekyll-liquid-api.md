---
layout : post
categories : api
tags : api
---

Here we'll get familiar with the Liquid syntax and learn about all the methods and logic available to us.

## Introduction

Jekyll uses the standard Liquid templating language package and includes a few other helpful extensions of its own.

Jekyll-bootstrap does not support plugin development so only the standard filters and logic will be available to us.

Remember we are the end-users!

## Liquid Crash Course

The following link contains a comprehensive course in everything available in Liquid.
The standard library is also available in Jekyll.

<http://github.com/Shopify/liquid/wiki/Liquid-for-Designers>

## Liquid Extensions Provided With Jekyll

Jekyll introduces a few other filters and tags as outlined here:

<http://github.com/mojombo/jekyll/wiki/Liquid-Extensions>

## Examples

Finally we take a look out the included helper examples and their source to see 
how we can display our post and site information in a more strategic manner.

<ul>
{% assign pages_list = site.categories.helpers %}
{% include helpers/pages_list.html %}
</ul>
