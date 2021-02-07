var $music = {};

$music.data = {
	more : {
		mseq : 0,
		abseq : 0,
		atseq : 0,
	},

	playList : {
		/*	status에 들어갈 값
			nothing // 재생목록에 아무것도없는 상태
			on 		// 재생목록에 하나이상의 노래가 있고, 재생중
			off 	// 재생목록에 하나이상의 노래가 있지만, 재생하지않음
		*/
		status : "nothing",

		// 실행중인 곡 번호
		playingNumber : null,
		
		// 재생목록 정보배열
		items : [
			/* example
			{
				mseq : null,	곡 번호
				title : null,	곡 제목
				src : null,		곡 재생경로
				
				abseq : null,	앨범 번호
				abimg : null,	앨범 재킷
				
				atseq : null,	아티스트 번호
				name : null		아티스트 이름
			}*/
		]
	},

};

$music.utilMethod = {
	/* 목록중 선택한 음악 DOM으로부터 제이쿼리를 통해 필요한 값들을 객체로 반환 */
	getHiddenData: function(self) {
		return {
			mseq : self.closest("tr").find("input[name=mseq]").val()
			, abseq : self.closest("tr").find("input[name=abseq]").val()
			, atseq : self.closest("tr").find("input[name=atseq]").val()
			, title : self.closest("tr").find("input[name=title]").val()
			, src : self.closest("tr").find("input[name=src]").val()
			, abimg : self.closest("tr").find("input[name=abimg]").val()
			, name : self.closest("tr").find("input[name=name]").val()
		}
	},
}

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
	
		var off_musicMoreBox = function() {
			$("#musicMoreBox").hide();
			initFlag(); // 플래그 변수 값 초기화
			initAttr(); // 팝업의 경로 속성 초기화
		};
	
		var on_musicMoreBox = function(self) {
			var music = $music.utilMethod.getHiddenData(self);

			if ($music.data.more.mseq !== music.mseq) { // 최초 한번 클릭시

				// 스크롤 감지
				$(window).on("scroll", function(){
					/* 팝업 띄워놓고 스크롤하고다니면 이상한거같아서... 지우는게 낫다고 판단 */
					off_musicMoreBox();
				});

				var position = self.closest("td").offset();
				var scrollHeight = $(document).scrollTop();
				$("#musicMoreBox").css({
					left: position.left - 129,
					top: position.top + 86 - scrollHeight,
				});

				// hidden으로부터 읽어온 값 중 플래그값에 고유번호들만 저장
				applyFlag(
					music.mseq
					, music.abseq
					, music.atseq
				); 

				// 저장한 고유값으로 팝업 경로에 적용
				applyAttr();
	
				$("#musicMoreBox").show();
	
			} else { // 동일한 행의 더보기를 또 눌렀을 시
				off_musicMoreBox();
			}
		};
	
		return {
			on_musicMoreBox: on_musicMoreBox, // 더보기버튼 on
			off_musicMoreBox: off_musicMoreBox, // 더보기버튼 off
		}
	})(),

	/* 현재 뮤직리스트의 모든 곡을 재생목록에 추가 */
	allListen : (function() {
		
	})(),
	
	/* 재생목록 기능들을 가진 객체 리턴 */
	musicList : (function() {
		function getData() {
			return {
				status : $music.data.playList.status,
				playingNumber : $music.data.playList.playingNumber,
				items : $music.data.playList.items,
			};
		};

		function add(music, isFirst) {
			if (isFirst) {
				$music.data.playList.items.unshift(music); // 기존의 목록의 맨앞에 넣기
			} else {
				$music.data.playList.items.push(music); // 기존의 목록의 맨뒤에 넣기
			}
		};

		var stop = function() {
			$music.data.playList.status = "off"; // 상태 off로 변경
			alert("노래를 중단합니다(미구현)");
		};

		var play = function(mseq) {
			var now = getData().items.findIndex(function(music) {
				return music.mseq === getData().playingNumber; // 재생중인 곡번호가 몇번째 인지 반환
			});

			$music.data.playList.playingNumber = mseq; 	// 진행중 곡 번호 저장
			$music.data.playList.status = "on"; 		// 상태 on으로 변경

			// 전달받은 곡번호로 실행
			alert(mseq + "번 노래로 실행합니다(미구현) \n[재생목록 중 "+ (now+1) +"번째 노래입니다.]");
		};

		var next = function() {
			var now = getData().items.findIndex(function(music) {
				return music.mseq === getData().playingNumber; // 재생중인 곡번호가 몇번째 인지 반환
			});
			
			// 마지막곡 여부
			var isFinal = now === (getData().items.length - 1);

			// 마지막 곡이었다면
			if (isFinal) {
				play(getData().items[0].mseq); // 첫번째 곡으로 재생실행
			} else {
				play(getData().items[now + 1].mseq); // 현재 재생중인 곡의 다음곡으로 재생실행
			}
		};

		var prev = function() {
			var now = getData().items.findIndex(function(music) {
				return music.mseq === getData().playingNumber; // 재생중인 곡번호가 몇번째 인지 반환
			});
			
			// 처음곡 여부
			var isFirst = now === 0;

			// 첫번째 곡이었다면
			if (isFirst) {
				play(getData().items[items.length - 1].mseq); // 마지막 곡으로 재생실행
			} else {
				play(getData().items[now-1].mseq); // 현재 재생중인 곡의 이전곡으로 재생실행
			}
		};

		// 듣기 - 목록에서(tr)에서 듣기버튼을 누른경우
		var listen = function(self) {
			// 기존의 재생목록과 재생중인지 아닌지 상관없이 추가하고 바로 재생
			var music = $music.utilMethod.getHiddenData(self);

			add(music);
			play(music.mseq);
		};

		// 한곡 추가 - 목록에서(tr에서) 재생목록담기버튼을 누른경우
		var playListAdd = function(self) {
			// tr로 올라가서 music정보 수집
			var music = $music.utilMethod.getHiddenData(self);
			
			add(music);

			if ("nothing" === getData().status) { // 재생목록이 비어있을때 추가한경우
				play(music.mseq);
			}
			else if ("on" === getData().status) { // 재생목록에 곡이 있고, 재생중일때 추가한경우
				// do nothing ...
			}
			else if ("off" === getData().status) { // 재생목록에 곡이 있지만, 재생중이 아닐때 추가한경우
				// do nothing ...
			}
		};

		// 여러곡 추가 - 목록의 checkBox를 누른후 재생목록담기를 누른경우
		var playListAddChecked = function(self) {
			alert("여러곡 추가 미구현");
			// 음악목록중에 체크된 tr들을 선택

			// 걸러진 tr들을 반복하며 music정보를 수집하고 수집한 music으로 add를 실행

		};

		return {
			stop : stop,
			play : play,
			next : next,
			prev : prev,
			listen : listen,
			playListAdd : playListAdd,
			playListAddChecked : playListAddChecked,
		};
	})(),
};