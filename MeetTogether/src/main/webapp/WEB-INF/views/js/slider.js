$(function() {
	$("#slider-range").slider(
			{
				range : true,
				min : 18,
				max : 99,
				values : [ 18, 99 ],
				slide : function(event, ui) {
					$("#age").val(ui.values[0] + " ~ " + ui.values[1]);
				},
				change : function(event, ui) {
					// when the user change the slider
				},
				stop : function(event, ui) {
					// when the user stopped changing the slider
					document.getElementById("age1").value = ui.values[0];
					document.getElementById("age2").value = ui.values[1];
					pairAjax();
				
				}
			});
	$("#age").val(
			$("#slider-range").slider("values", 0) + " ~ "
					+ $("#slider-range").slider("values", 1));
});