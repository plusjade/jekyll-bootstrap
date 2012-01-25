---
layout: page
title: "Test"
---
{% include JB/setup %}

## Testing code-highlighting

{% highlight ruby %}
  conditions = ['']
  
  if params[:city].present?
    conditions[0] += "city_name = ?"
    conditions << params[:city]
  end

  if params[:state].present?
    conditions[0] += ' AND ' unless conditions.first.blank?
    conditions[0] += 'state_name > ?'
    conditions.push params[:state]
  end

  @users = User.find(:all, :conditions => conditions)
{% endhighlight %}