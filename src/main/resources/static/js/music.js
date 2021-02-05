var modalFlag = {
	musicMoreBoxSeq : 0,
};

var $music = (function() {
	return {
		on_musicMoreBox: function(el, mseq) {
			var self = $(el);
			
			if (modalFlag.musicMoreBoxSeq !== mseq) {
				var position = self.closest("td").offset();
				$("#musicMoreBox").css({
					left: position.left - 129,
					top: position.top + 86,
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

// 아이콘에 해당하는 버튼 hover기능
$(function() {
	$(".iconButton").mouseover(function() {
		$(this).find("span").css({
			color:"#cb78ff"
			, opacity: 0.5
		});
	});

	$(".iconButton").mouseleave(function() {
		$(this).find("span").css({
			color:"#333333"
			, opacity: 1
		});
	});
})