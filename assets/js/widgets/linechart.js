var linechartWidget = linechartWidget || { Models: {}, Widgets: {} };
$(function(){
	
	linechartWidget.Models.LinechartModel = Backbone.Model.extend( { 
		initialize: function() {_.bindAll(this); }
	});
	
	linechartWidget.Widgets.bind = function(attributes) {
		var attribs = attributes || {};
		
		//setup line chart canvas for drawing
		var panelWidth = attribs.colWidth;
		var panelHeight = attribs.rowHeight;
		var canvasWidth = gridster.options.widget_base_dimensions[0] * panelWidth;
		var canvasHeight = gridster.options.widget_base_dimensions[0] * panelHeight * 0.80;
		var canvas = document.getElementById( attribs.target );
		canvas.width  = canvasWidth;
		canvas.height = canvasHeight;
		var ctx = canvas.getContext("2d");

		//set on change handler
		var linechartModel = new linechartWidget.Models.LinechartModel();
		linechartModel.url = attribs.apiUrl;
		linechartModel.on( 'change', function(){
			new Chart( ctx ).Line( linechartModel.toJSON(), { scaleShowGridLines :false, bezierCurve :false } );
		});
		
		//fetch data
		linechartModel.fetch();
		if ( attribs.refreshRate && attribs.refreshRate > 0 ){
			setInterval( linechartModel.fetch, attribs.refreshRate);
		}
	};
	
}());