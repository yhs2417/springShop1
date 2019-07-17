$('a.animatescroll').on("click", function() {
		let x = $(this).attr("href")
		console.log(x)
		$(x).animatescroll();
	});
	
	$('.carousel').carousel({
		interval : 2000
	});

	$('[data-toggle="tooltip"]').tooltip();

	$('#wayPoint').waypoint(function(direction) {
		if (direction === 'down') {
			$('#firstNav').attr("style", "visibility:hidden");
			$('#secondNav').attr("style", "visibility:visible");
			$('#btn_top').css("visibility", "visible");
		}
	}, {
		offset : '10'
	});

	$('#wayPoint').waypoint(function(direction) {
		if (direction === 'up') {
			$('#firstNav').attr("style", "visibility:visible");
			$('#secondNav').attr("style", "visibility:hidden");
			$('#btn_top').css("visibility", "hidden");
		}
	}, {
		offset : '10'
	});//jquery end

