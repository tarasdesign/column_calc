$(document).ready(function() {
	"use strict";

	var screenWidth;
	var gap;
	var minMargin;
	var maxMargin;
	var maxErrors;
	var cols;
	var sideMargin;
	var colWidth;

	function calculate(colNumber) {
	    colWidth = (screenWidth - sideMargin * 2 - gap * (colNumber - 1)) / colNumber;
		return colWidth;
	}
	
	function update() {
		
		$("#result").empty();
		
		screenWidth = parseInt($('#screenWidth').val());
		gap = parseInt($('#gap').val());
		minMargin = parseInt($('#minMargin').val());
		maxMargin = parseInt($('#maxMargin').val());
		maxErrors = parseInt($('#maxErrors').val());
		cols = parseInt($('#cols').val());
		var total = 0;
		
		for (var x = 0; x < (maxMargin - minMargin); x++) {

			sideMargin = minMargin + x;

			var numberOfErrors = 0;
			var tooNarrow = false;

			for (var i = 1; i < cols + 1; i++) {

				calculate(i);

				if (!Number.isInteger(colWidth)) {
					numberOfErrors++;
				}
				
				if (colWidth <= gap) {
					tooNarrow = true;
				}
			}
			
			var lastIsInteger = Number.isInteger(calculate(cols)); // Last column must be integer			
			if ((parseInt(numberOfErrors) <= maxErrors) && lastIsInteger && !tooNarrow) {

				$("#result").append("<p>screen: " + screenWidth + "</p>");
				$("#result").append("<p>margin: " + sideMargin + "</p>");
				$("#result").append("<p>errors: " + numberOfErrors + "</p><br/>");

				for (var j = 1; j < cols + 1; j++) {
					calculate(j);
					if (Number.isInteger(colWidth)) {
						$("#result").append("<p>" + j + " col —> width: " + colWidth + "</p>");
					} else {
						$("#result").append("<p class='error'>" + j + " col —> width: " + Math.round(colWidth * 1000) / 1000 + "</p>");
					}
				}
				$("#result").append("<p class='last'></p>");
				total++;
			}		
		}
		$("#result").append("<p class='last'>total: " + total + "</p>");
	}
	
	update();
	
	$(".button").on("click", function() {
		update();
	});
	
	
});
