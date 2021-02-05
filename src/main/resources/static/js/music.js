var $music = {};

$music.data = {
	more : {
		mseq : 0,
		abseq : 0,
		atseq : 0,
	}
};

$music.method = {
	/* 듣기, 재생목록, 내리스트, 더보기 같은 아이콘의 hover기능 TODO: 모든 아이콘제어는 이걸로 하게되면 색깔 일괄변경 가능 */
	iconHoverListen : (function() {
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
		});
	})(),

	/* 더보기 버튼 hover 기능 */
	moreHoverListen : (function() {
		$(function() {
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
		});
	})(),

	/* 더보기 관련 on/off함수포함한 객체 리턴 */
	more : (function() {

		function initFlag() {
			$music.data.more.mseq = 0;
			$music.data.more.abseq = 0;
			$music.data.more.atseq = 0;
		};
		
		function applyFlag(mseq, abseq, atseq) {
			$music.data.more.mseq = mseq;
			$music.data.more.abseq = abseq;
			$music.data.more.atseq = atseq;
		};
	
		function initAttr() {
			$("#musicMoreBox .textBox").eq(0).find("a").attr("href", "#");
			$("#musicMoreBox .textBox").eq(1).find("a").attr("href", "#");
			$("#musicMoreBox .textBox").eq(2).find("a").attr("href", "#");
			$("#musicMoreBox .textBox").eq(3).find("a").attr("href", "#");
			$("#musicMoreBox .textBox").eq(4).find("a").attr("href", "#");
		};
	
		function applyAttr() {
			$("#musicMoreBox .textBox").eq(0).find("a").attr("href", "musicView?mseq=" + $music.data.more.mseq);
			$("#musicMoreBox .textBox").eq(1).find("a").attr("href", "albumView?abseq=" + $music.data.more.abseq);
			$("#musicMoreBox .textBox").eq(2).find("a").attr("href", "artistView?atseq=" + $music.data.more.atseq);
			$("#musicMoreBox .textBox").eq(3).find("a").attr("href", "like?mseq=" + $music.data.more.mseq);
			$("#musicMoreBox .textBox").eq(4).find("a").attr("href", "ban?mseq=" + $music.data.more.mseq);
		};
	
		var _off_musicMoreBox = function() {
			$("#musicMoreBox").hide();
			initFlag(); // 플래그 변수 값 초기화
			initAttr(); // 팝업의 경로 속성 초기화
		};
	
		var _on_musicMoreBox = function(el, mseq, abseq, atseq) {
	
			var self = $(el);
			
			if ($music.data.more.mseq !== mseq) { // 최초 한번 클릭시

				// 스크롤 감지
				$(window).on("scroll", function(){
					/* 팝업 띄워놓고 스크롤하고다니면 이상한거같아서... 지우는게 낫다고 판단 */
					_off_musicMoreBox();
				});

				var position = self.closest("td").offset();
				var scrollHeight = $(document).scrollTop();
				$("#musicMoreBox").css({
					left: position.left - 129,
					top: position.top + 86 - scrollHeight,
				});
	
				applyFlag(mseq, abseq, atseq); // 읽어온 값으로 플래그값에 고유번호 저장
				applyAttr();// 저장한 고유값으로 팝업 경로에 적용
	
				$("#musicMoreBox").show();
	
			} else { // 동일한 행의 더보기를 또 눌렀을 시
				_off_musicMoreBox();
			}
		};
	
		return {
			on_musicMoreBox: _on_musicMoreBox, // 더보기버튼 on
			off_musicMoreBox: _off_musicMoreBox, // 더보기버튼 off
		}
	})(),

	/* 현재 뮤직리스트의 모든 곡을 재생목록에 추가 */
	allListen : (function() {
		console.log("기존의 재생목록은 지우고, 현재 화면상에 나타난 모든 곡으로 재생목록을 초기화하고, 초기화한 재생목록의 첫곡 자동실행해주기(아직 미구현)");
	})(),
};