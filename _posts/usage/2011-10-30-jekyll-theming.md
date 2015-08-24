---
layout: post
title : Blog Themes
categories : usage
---

## Introduction

As of JB version 0.2.0 themes are now entirely modular. They are tracked and versioned individually as **Theme Packages**.
This allows everyone to publish and share themes freely.

Jekyll-Bootstrap v 0.2.0 ships with only the stock "twitter" theme.
Additional themes need to be "installed" as outlined below.

<span class="label warning">NOTE</span>
Jekyll-Bootstrap uses `rake tasks` to implement much of its functionality.
If you are new to `rake` a rake task is just a ruby method that can be run in the base-directory
of Jekyll-Bootstrap. You should never run arbitrary server side code on your system without first reviewing the source!
View the [Rakefile](https://github.com/plusjade/jekyll-bootstrap/blob/master/Rakefile) source.

## Find Themes

You can find and browse the latest official themes in the [Theme Explorer](http://themes.jekyllbootstrap.com).
The theme explorer is still a work in progress; it shows full-website previews of all available themes.

<div style="ext-align:right; margin-bottom:10px">
  <a href="http://themes.jekyllbootstrap.com" class="btn primary" style="">Launch Theme Explorer</a>
</div>

Additionally, designers are free to publish their own themes as long as they are packaged appropriately.
You can then use the same installation method outlined below to install the theme.

Directly browse current Theme Packages on GitHub: <https://github.com/jekyllbootstrap>

## Install Themes

Install a theme by using the rake task and passing in the theme's git url.

    $ rake theme:install git="https://github.com/jekyllbootstrap/theme-the-program.git"

The installer uses git to download the Theme Package and then installs it.
If you have obtained a Theme Package in another way, such as zip download, you can manually
place it into your `./_theme_packages` folder and then run the installer with the name of the theme.

    $ rake theme:install name="THEME-NAME"

As a convenience, after the install is successful, the task will ask you if you'd like to switch to the newly installed theme.
Type 'y' and enter to switch!

## Switch Themes

Once your themes are installed you can switch between them via rake task:

    $ rake theme:switch name="the-program"
      
    ## for 0.1.0 users `rake switch_theme` still works.
    
## Customize Themes

Theme layouts are contained in `./_includes/themes/THEME-NAME`.
It is important that you edit files in the theme directory rather than `_layouts` 
because switching themes will overwrite files in the `_layout` directory and you will lose your changes.
The main point here is keeping themes modular; this way editing one does not affect the other.

### Adding Templates

You are free add extra template files to `_layouts` in order to customize your blog.

However if you want to add theme-specific layouts you should add them to the theme's directory in `_includes`.
After your files are added make sure to run the switcher again:

    $ rake theme:switch name="the-minimum"


### Static Assets

Static assets are name-spaced for each theme. They are available at `./assets/themes/THEME-NAME`.
Make sure you edit and add assets in this directory.
All themes are provided with the liquid variable: `ASSET_PATH` which trace back to the aforementioned directory.

## Add Your Own Theme

Read the [Theme API Documentation](/api/theme-api.html) for instructions on how to build and publish custom themes for Jekyll Bootstrap.

