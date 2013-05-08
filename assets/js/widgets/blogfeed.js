var blogFeedWidget = blogFeedWidget || { Models: {}, Collections: {}, Views: {} };
$(function(){
	blogFeedWidget.Models.BlogModel = Backbone.Model.extend( {});
	blogFeedWidget.Collections.BlogList = Backbone.Collection.extend({
		model: blogFeedWidget.Models.BlogModel,
		initialize: function() {_.bindAll(this); },
		url: "/dashboard/index.cfm/api/blogfeed"
	});
	
	blogFeedWidget.Views.BlogPostView = Backbone.View.extend({
		template: _.template( $('#blogpost-template').html() ),
		
		initialize: function() {
			this.blogList = new blogFeedWidget.Collections.BlogList();
			
			this.blogList.on( 'reset', this.addAll, this );
			this.blogList.fetch({reset:true, data: $.param({ feed: this.options.blogUrl}) });
			var blogView = this;
			if ( this.options.refreshRate && this.options.refreshRate > 0 ){
				setInterval( function(){ blogView.blogList.fetch({reset:true, data: $.param({ feed: blogView.options.blogUrl}) }); }, blogView.options.refreshRate);
			}
		},
		addAll: function() {
			$( this.options.target ).html( '' );
			this.blogList.each( this.addOne, this );
		},
		addOne: function( blogPost ) {
			$( this.options.target ).append( this.template( blogPost.toJSON() ) );
		},
		render: function() { return this; }
	});
}());