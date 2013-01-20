// Basic tab functionality
var Tabs = {
  $list : null,
  $content : null,
  
  init : function(list, content){
   Tabs.$list = $(list);
   Tabs.$content = $(content);
   
   Tabs.$list.find("a").click(function(e){
     Tabs.show($(this).parent().index());
     e.preventDefault();
     return false;
   })
   
   Tabs.show(0);
  },
  
  show : function(index){
    Tabs.$list
      .find("li").removeClass("active")
      .eq(index).addClass("active");
    Tabs.$content
      .find("div").hide()
      .eq(index).show();
  }
}


// Personalize install code. 
// Make sure to update this whenever landing page changes to ensure proper id values.
var Pc = {
  init : function(){
    var $codeContainer = $("#step-2-code").find("code");
    var code = $codeContainer.text();
    var $repoName = $("#repo_name");
    var $blogLink = $("#blog_link");
    $("form").first().submit(function(e){
      var username = $("#github_username").val();
      $codeContainer.text(code.replace(/USERNAME/g, username));
      $repoName.text( username + ".github.com");
      $blogLink.text("http://" + username + ".github.com").attr("href", "http://" + username + ".github.com");
      if ($.trim(username) !== ""){ 
        if (typeof mpq !== 'undefined') mpq.track("install", {"username": username });
        if (typeof _gaq !== 'undefined') _gaq.push(['_trackEvent', 'Forms', 'Input', username]);
      }  
      e.preventDefault();
      return false;
    })
  }
}

// Table Of Contents
var Toc = {
  $container : null,
  $wrapper : null,
  
  init : function(container, wrapper){
    Toc.$container = $(container);
    Toc.$wrapper = $(wrapper);
    
    Toc.build();
  },

  build : function(){
    var h1 = [];
    var h2 = [];

    Toc.$wrapper.find("h1").each(function(){
      var h = {h1 : this, children : null }
      h.children = $(this).nextUntil("h1", "h2");
      h1.push(h);
    })

    var cache = "<ul class='nest'>";
    h1.forEach(function(node){
      // omit primary header since we are nesting it into the main sidebar.
      if(h1[0].h1.innerHTML !== node.h1.innerHTML)
        cache += '<li><strong>'+$(node.h1).text()+'</strong></li>';

      node.children.each(function(){
        cache += '<li class="sub"><a href="#'+ this.id + '">'+ $(this).text() + '</a></li>';
      })
    })
    cache += "</ul>";

    Toc.$container.find("li.active").append(cache);
  },
  
  toggle :function(){
    if($(window).width() > 1000) Toc.$container.show();
    else Toc.$container.hide();
  }
}