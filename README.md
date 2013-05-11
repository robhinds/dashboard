Handsome
=========

A little while a go, I came across the awesome "Dashing" dashboard (http://shopify.github.io/dashing/) created by the guys over at Shopify, and thought to myself, golly, thats pretty ace.  Unfortunately though, the dashboard is all written in ruby, coffescript and other such tech that I'm not so clued up with, so I thought I would try and re-create the essence of Dashing (its not really a port, as I didn't go through the code/architecture those guys have designed, I just looked at the demo and designed the rest my self).

You can check out a little demo here: http://handsome.cloudfoundry.com/ - It doesn't really have many widgets yet, and this demo is actually the code dropped into a Spring webapp, as I don't have CF hosting options.

This dashboard uses ColdFusion10 on the server side (I'm normally a java server side guy, but for one reason or another this server side implementation is CF10 - although I will likely port the server side stuff to java pretty soon as well) and a whole host of javascript libraries to do most of the work on the client side.

The Javascript in use is currently:

- gridster.js - this library does most of the work in making it look wicked cool and the whole drag and drop stuff
- backbone.js - Each widget is a view for a model, and just hits up an api to load in the content
- charts.js - as it suggests, this provides some sweet html5/js charts stuff
- gauge.js - again, as you'd expect, this one drives the gage widget
