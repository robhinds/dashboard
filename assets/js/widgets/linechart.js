var linechartWidget = linechartWidget || { Models: {}, Views: {} };
$(function(){
	
	linechartWidget.Models.LinechartModel = Backbone.Model.extend( { 
		initialize: function() {_.bindAll(this); }
	});
	
	linechartWidget.Views.LinechartView = Backbone.View.extend({
		initialize: function() {
			//initialize canvas
			var panelWidth = this.options.colWidth;
			var panelHeight = this.options.rowHeight;
			var canvasWidth = (gridster.options.widget_base_dimensions[0] * panelWidth) + 20;
			var canvasHeight = gridster.options.widget_base_dimensions[0] * panelHeight * 0.80;
			var canvas = document.getElementById( this.options.target );
			canvas.width  = canvasWidth;
			canvas.height = canvasHeight;
			this.ctx = canvas.getContext("2d");
			
			//initialize model
			this.model = new linechartWidget.Models.LinechartModel();
			this.model.url = this.options.apiUrl;
			this.model.on( 'change', this.render, this );
			this.model.fetch();
			var lineChartView = this;
			if ( this.options.refreshRate && this.options.refreshRate > 0 ){
				setInterval(lineChartView.model.fetch, lineChartView.options.refreshRate);
			}
		},

		render: function() {
			new Chart( this.ctx ).Line( this.model.toJSON(), { scaleShowGridLines :false, bezierCurve :true } );
			return this;
		}
	});
}());