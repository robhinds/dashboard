var twitterWidget = twitterWidget || { Models: {}, Views: {} };
$(function(){
	twitterWidget.Models.TweetModel = Backbone.Model.extend( { 
		url: "/dashboard/index.cfm/api/latesttweet",
		initialize: function() {_.bindAll(this); }
	});
	
	twitterWidget.Views.TweetView = Backbone.View.extend({
		tagName: 'div',
		sampleGridRowTpl:_.template( $('#latest-tweet-template').html() ),
		initialize: function() { this.model.on( 'change', this.render, this ); },
		render: function () {
			this.$el.html( this.sampleGridRowTpl( this.model.toJSON() ) );
			$('#twitter').append( this.$el );
		}
	});
}());