var gageWidget = gageWidget || { Models: {}, Views: {} };
$(function(){
	
	gageWidget.Models.GageModel = Backbone.Model.extend( { 
		initialize: function() {_.bindAll(this); }
	});
	
	gageWidget.Views.GageView = Backbone.View.extend({
		initialize: function() {
			//initialize canvas
			var panelWidth = this.options.colWidth;
			var canvasWidth = ( gridster.options.widget_base_dimensions[0] * panelWidth);
			var canvas = document.getElementById( this.options.target );
			canvas.width  = canvasWidth;
			
			//initialize model
			this.model = new gageWidget.Models.GageModel();
			this.model.url = this.options.apiUrl;
			this.model.on( 'change', this.render, this );
			this.model.fetch();
			var gageView = this;
			if ( this.options.refreshRate && this.options.refreshRate > 0 ){
				setInterval(gageView.model.fetch, gageView.options.refreshRate);
			}
		},

		render: function() {
			var opts = {
				lines: 12,
				angle: 0.0,
				lineWidth: 0.44,
				pointer: {
					length: 0.9,
					strokeWidth: 0.035,
					color: '#000000'
				},
				colorStart: '#E0C61F', 
				colorStop: '#E0C61F',  
				strokeColor: '#E0DCBA', 
				generateGradient: true
			};
			if ( !this.gauge ){
				var target = document.getElementById( this.options.target );
				this.gauge = new Gauge(target).setOptions(opts);
			}
			this.gauge.maxValue = this.model.toJSON().maxValue;
			this.gauge.set( this.model.toJSON().value ); 
			$( '#' + this.options.target + '-value' ).html( this.model.toJSON().value );
			return this;
		}
	});
}());