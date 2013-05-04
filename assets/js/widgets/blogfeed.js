var blogFeedWidget = blogFeedWidget || { Models: {}, Views: {}, Collections: {} };
$(function(){
	blogFeedWidget.Models.BlogModel = Backbone.Model.extend( {});
	
	var BlogList = Backbone.Collection.extend({
		model: blogFeedWidget.Models.BlogModel,
		initialize: function() {_.bindAll(this); },
		url: "/dashboard/index.cfm/api/blogfeed?feed=http://blog.nerdability.com/feeds/posts/default"
	});
	blogFeedWidget.Collections.BlogList = new BlogList();
	
	blogFeedWidget.Views.BlogView = Backbone.View.extend({
		tagName: 'div',
		blogPostTpl:_.template( $('#blogpost-template').html() ),
		initialize: function() {},
		render: function () {
			this.$el.html( this.blogPostTpl( this.model.toJSON() ) );
			return this;
		}
	});
	
	blogFeedWidget.Views.BlogListView = Backbone.View.extend({
		el:  "#widget-blog",
		initialize: function() {
			blogFeedWidget.Collections.BlogList.on('reset', this.addAll, this);
		},
		render: function () {},
		addOne: function( blog ){
			var view = new blogFeedWidget.Views.BlogView( { model: blog } );
			$('#latest-blog-posts').append( view.render().el );
		},
		addAll: function() {
			$('#latest-blog-posts').html('');
			blogFeedWidget.Collections.BlogList.each(this.addOne, this);
		}
	});
}());