The Challenge
=============

I am looking for a way to detect the methods being called from all haml or erb files used in a request at runtime in a manner that would allow me to call source_location on the methods.

The Explanation
===============

So when working on a refactor of a large Rails app I didn't build I'm often trying to a.) trace back where items in the views are defined and b.) explain why code is complex to developers who don't see it yet. I've been thinking about a possible open-source visualization tool that could make life easier... especially in projects where there is a lot of monkey patching, presenters, or helpers being used.

My goal is to be able to see complexity and/or provide documentation for view tier data sourcing in a dynamic and often meta-programmed environment. Doing this would require me to detect what methods are being called in an erb or haml file at runtime... and I'm starting to think it's not really possible.

This app is just a fast demo of what my near-term target is with the hope someone can point me in the right direction.  It's a simple Rails 4 install using SQLite with a scaffold and a couple POROs to give me a simple test to hack against.

At the moment only the show route on birds controller matters.  I instanciate the hash in the app controller and then populate it at the end of each view file (well - used on this call anyway).  For now I am just debugging the result at the end of application.html.erb.

Looks like this:


<pre class="debug_dump">---
:views_birds_show:
&nbsp; notice:
&nbsp; - &quot;/Users/brianmcelaney/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/actionpack-4.0.4/lib/abstract_controller/helpers.rb&quot;
&nbsp; - 52
&nbsp; &quot;@bird.name&quot;:
&nbsp; - &quot;/Users/brianmcelaney/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.0.4/lib/active_record/attribute_methods/read.rb&quot;
&nbsp; - 58
&nbsp; &quot;@bird.sing&quot;:
&nbsp; - &quot;/Users/brianmcelaney/workspace/reflect_test/app/models/bird.rb&quot;
&nbsp; - 2
&nbsp; BingService.new().woop:
&nbsp; - &quot;/Users/brianmcelaney/workspace/reflect_test/app/service/bing_service.rb&quot;
&nbsp; - 2
&nbsp; link_to:
&nbsp; - &quot;/Users/brianmcelaney/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/actionpack-4.0.4/lib/action_view/helpers/url_helper.rb&quot;
&nbsp; - 174
:application:
&nbsp; stylesheet_link_tag:
&nbsp; - &quot;/Users/brianmcelaney/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/sprockets-rails-2.0.1/lib/sprockets/rails/helper.rb&quot;
&nbsp; - 108
&nbsp; javascript_include_tag:
&nbsp; - &quot;/Users/brianmcelaney/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/sprockets-rails-2.0.1/lib/sprockets/rails/helper.rb&quot;
&nbsp; - 86
&nbsp; csrf_meta_tags:
&nbsp; - &quot;/Users/brianmcelaney/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/actionpack-4.0.4/lib/action_view/helpers/csrf_helper.rb&quot;
&nbsp; - 19
&nbsp; PingService.hello:
&nbsp; - &quot;/Users/brianmcelaney/workspace/reflect_test/app/service/ping_service.rb&quot;
&nbsp; - 6
</pre>

This output is useful for my goals.  My method of getting this output is not.


