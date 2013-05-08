var twitterWidget = twitterWidget || { Models: {}, Widgets: {}, Views: {} };
$(function(){
	
	twitterWidget.Models.TweetModel = Backbone.Model.extend( { 
		url: "/dashboard/index.cfm/api/latesttweet",
		initialize: function() {_.bindAll(this); }
	});
	
	twitterWidget.Views.TweetView = Backbone.View.extend({
		template: _.template( $('#latest-tweet-template').html() ),
		
		initialize: function() {
			this.model = new twitterWidget.Models.TweetModel();
			this.model.on( 'change', this.render, this );
			this.model.fetch( {data: $.param( {userName: this.options.userName} )} );
			var tweetView = this;
			if ( this.options.refreshRate && this.options.refreshRate > 0 ){
				setInterval(function(){ tweetView.model.fetch( {data: $.param( {userName: tweetView.options.userName} )} ); }, tweetView.options.refreshRate);
			}
		},

		render: function() {
			$( this.options.target ).append( this.template( this.model.toJSON() ) );
			return this;
		}
	});
	
}());