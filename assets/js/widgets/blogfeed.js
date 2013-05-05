var blogFeedWidget = blogFeedWidget || { Models: {}, Collections: {}, Widgets: {} };
$(function(){
	blogFeedWidget.Models.BlogModel = Backbone.Model.extend( {});
	blogFeedWidget.Collections.BlogList = Backbone.Collection.extend({
		model: blogFeedWidget.Models.BlogModel,
		initialize: function() {_.bindAll(this); },
		url: "/dashboard/index.cfm/api/blogfeed"
	});
	
	blogFeedWidget.Widgets.bind = function(attributes) {
		var attribs = attributes || {};
		var blogPostTemplate = _.template( $('#blogpost-template').html() );
		var blogList = new blogFeedWidget.Collections.BlogList( {url:'bad url'} );
		
		//handle change events
		blogList.on('reset', function(){
			var targetElementId = attribs.target || "#latest-blog-posts"
			$( targetElementId ).html('');
			blogList.each(function( blogPost ){
				$( targetElementId ).append( blogPostTemplate( blogPost.toJSON() ) );
			}, this);
		});
		
		//fetchdata		
		blogList.fetch({reset:true, data: $.param({ feed: attribs.blogUrl}) });
		if ( attribs.refreshRate && attribs.refreshRate > 0 ){
			setInterval( function(){ blogList.fetch({reset:true, data: $.param({ feed: attribs.blogUrl}) }); }, attribs.refreshRate);
		}
	};
}());