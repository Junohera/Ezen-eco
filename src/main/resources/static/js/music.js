var $music = (function() {
	return {
		showMusicMoreBox: function(el) {
			var self = $(el);

			var position = self.closest("tr").offset();
			$("#musicMoreBox").css({
				right: 0,
				top: position.top * 1 + 40,
			});
			$("#musicMoreBox").show();
			setTimeout(function() {
				$("body").on("click", function(e) {
					if (!$("#musicMoreBox").is(e.target) && $("#musicMoreBox").has(e.target).length === 0){
						$("#musicMoreBox").hide();
						$("body").off("click");
					}
				});
			}, 100);

		},
	}
})();