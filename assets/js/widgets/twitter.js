var twitterWidget = twitterWidget || { Models: {}, Widgets: {} };
$(function(){
	
	twitterWidget.Models.TweetModel = Backbone.Model.extend( { 
		url: "/dashboard/index.cfm/api/latesttweet",
		initialize: function() {_.bindAll(this); }
	});
	
	twitterWidget.Widgets.bind = function(attributes) {
		var attribs = attributes || {};
		var tweetTemplate = _.template( $('#latest-tweet-template').html() );
		var tweetModel = new twitterWidget.Models.TweetModel();
		tweetModel.on( 'change', function(){
			var targetElementId = attribs.target || "#twitter"
			$( targetElementId ).append( tweetTemplate( tweetModel.toJSON() ) );
		});
		
		//fetchdata		
		tweetModel.fetch( {data: $.param( {userName: attribs.userName} )} );
		if ( attribs.refreshRate && attribs.refreshRate > 0 ){
			setInterval(function(){ tweetModel.fetch( {data: $.param( {userName: attribs.userName} )} ); }, attribs.refreshRate);
		}
	};
	
}());