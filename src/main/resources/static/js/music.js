var musicMoreBoxParameter = {
	mseq : 0,
	abseq : 0,
	atseq : 0,
};

var $music = (function() {

	function initFlag() {
		musicMoreBoxParameter.mseq = 0;
		musicMoreBoxParameter.abseq = 0;
		musicMoreBoxParameter.atseq = 0;
	};
	
	function applyFlag(mseq, abseq, atseq) {
		musicMoreBoxParameter.mseq = mseq;
		musicMoreBoxParameter.abseq = abseq;
		musicMoreBoxParameter.atseq = atseq;
	};

	function initAttr() {
		$("#musicMoreBox .textBox").eq(0).find("a").attr("href", "#");
		$("#musicMoreBox .textBox").eq(1).find("a").attr("href", "#");
		$("#musicMoreBox .textBox").eq(2).find("a").attr("href", "#");
		$("#musicMoreBox .textBox").eq(3).find("a").attr("href", "#");
		$("#musicMoreBox .textBox").eq(4).find("a").attr("href", "#");
	};

	function applyAttr() {
		$("#musicMoreBox .textBox").eq(0).find("a").attr("href", "musicView?mseq=" + musicMoreBoxParameter.mseq);
		$("#musicMoreBox .textBox").eq(1).find("a").attr("href", "albumView?abseq=" + musicMoreBoxParameter.abseq);
		$("#musicMoreBox .textBox").eq(2).find("a").attr("href", "artistView?atseq=" + musicMoreBoxParameter.atseq);
		$("#musicMoreBox .textBox").eq(3).find("a").attr("href", "like?mseq=" + musicMoreBoxParameter.mseq);
		$("#musicMoreBox .textBox").eq(4).find("a").attr("href", "ban?mseq=" + musicMoreBoxParameter.mseq);
	};

	var _off_musicMoreBox = function() {
		$("#musicMoreBox").hide();
		initFlag(); // 플래그 변수 값 초기화
		initAttr(); // 팝업의 경로 속성 초기화
		console.log('musicMoreBoxParameter =>', JSON.stringify(musicMoreBoxParameter, undefined, 2));
	};

	var _on_musicMoreBox = function(el, mseq, abseq, atseq) {

		var self = $(el);
		
		if (musicMoreBoxParameter.mseq !== mseq) { // 최초 한번 클릭시
			var position = self.closest("td").offset();
			var scrollHeight = $(document).scrollTop();
			$("#musicMoreBox").css({
				left: position.left - 129,
				top: position.top + 86 - scrollHeight,
			});

			applyFlag(mseq, abseq, atseq); // 읽어온 값으로 플래그값에 고유번호 저장
			applyAttr();// 저장한 고유값으로 팝업 경로에 적용

			$("#musicMoreBox").show();

			console.log('musicMoreBoxParameter =>', JSON.stringify(musicMoreBoxParameter, undefined, 2));
		} else { // 동일한 행의 더보기를 또 눌렀을 시
			_off_musicMoreBox();
		}
	};


	return {
		on_musicMoreBox: _on_musicMoreBox,

		off_musicMoreBox: _off_musicMoreBox,
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

	$("#musicMoreBox .textBox").mouseover(function() {
		$(this).prev().find("span").css({color: "#ffffff"});
		$(this).next().show();
		$(this).parent().css({background: "#dedede"});
		$(this).find("a").css({color: "#cb78ff"});
	});

	$("#musicMoreBox .textBox").mouseleave(function() {
		$(this).prev().find("span").css({color: "#333333"});
		$(this).next().hide();
		$(this).parent().css({background: "#ffffff"});
		$(this).find("a").css({color: "#333333"});
	});

	$("#listBox .moreDiv").on("click", function() {
		var mseq = $(this).closest("tr").find("input[name='mseq']").val();
		var abseq = $(this).closest("tr").find("input[name='abseq']").val();
		var atseq = $(this).closest("tr").find("input[name='atseq']").val();
		$music.on_musicMoreBox($(this), mseq, abseq, atseq);
	});

});

// 스크롤 
$(window).on("scroll", function(){
	$music.off_musicMoreBox();
});