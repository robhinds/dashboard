<script type="text/javascript">
  var gridster;
  $(function(){

    gridster = $(".gridster > ul").gridster({
        widget_margins: [15, 15],
        widget_base_dimensions: [270, 300],
        min_cols: 6
    }).data('gridster');

  });
</script>

<div class="gridster">
	<ul style="position: relative;">
		<cfoutput>#widgets#</cfoutput>
	</ul>
</div>