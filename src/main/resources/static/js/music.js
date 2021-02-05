var modalFlag = {
	musicMoreBoxSeq : 0,
};

var $music = (function() {
	return {
		on_musicMoreBox: function(el, mseq) {
			var self = $(el);
			
			if (modalFlag.musicMoreBoxSeq !== mseq) {
				var position = self.offset();
				$("#musicMoreBox").css({
					left: position.left * 1 - 120,
					top: position.top * 1 + 52,
				});
	
				$("#musicMoreBox").show();
			}
		},

		off_musicMoreBox: function() {
			$("#musicMoreBox").hide();
			modalFlag.musicMoreBoxSeq = 0;
		},
	}
})();