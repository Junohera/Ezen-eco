-- member
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno@gmail.com', '1234', 'juno', '010-2172-7790', 'M');
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno1@gmail.com', '1234', 'juno', '010-2172-7791', 'M');
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno2@gmail.com', '1234', 'juno', '010-2172-7792', 'M');
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno3@gmail.com', '1234', 'juno', '010-2172-7793', 'M');
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno4@gmail.com', '1234', 'juno', '010-2172-7794', 'M');
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno5@gmail.com', '1234', 'juno', '010-2172-7795', 'M');
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno6@gmail.com', '1234', 'juno', '010-2172-7796', 'M');
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno7@gmail.com', '1234', 'juno', '010-2172-7797', 'M');
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno8@gmail.com', '1234', 'juno', '010-2172-7798', 'M');
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno9@gmail.com', '1234', 'juno', '010-2172-7799', 'M');

-- admin
insert into admin(aseq, id, pw) values(admin_seq.nextval, 'admin', 'admin');

-- theme
insert into theme(tseq, title) values(theme_seq.nextval, '시원한');
insert into theme(tseq, title) values(theme_seq.nextval, '감성적인');
insert into theme(tseq, title) values(theme_seq.nextval, '슬픈');
insert into theme(tseq, title) values(theme_seq.nextval, '기쁜');
insert into theme(tseq, title) values(theme_seq.nextval, '술마실때');
insert into theme(tseq, title) values(theme_seq.nextval, '퇴근길');
insert into theme(tseq, title) values(theme_seq.nextval, '비');
insert into theme(tseq, title) values(theme_seq.nextval, '눈');
insert into theme(tseq, title) values(theme_seq.nextval, '운전');
insert into theme(tseq, title) values(theme_seq.nextval, '새벽');
insert into theme(tseq, title) values(theme_seq.nextval, '몽환');
insert into theme(tseq, title) values(theme_seq.nextval, '눙물');
insert into theme(tseq, title) values(theme_seq.nextval, 'ㅠㅠ');
insert into theme(tseq, title) values(theme_seq.nextval, 'ㄱㅇㄷ');

-- chart
insert into chart(cseq, title, img) values(chart_seq.nextval, 'FLO 차트', null);
insert into chart(cseq, title, img) values(chart_seq.nextval, '지금 급상승 중', null);
insert into chart(cseq, title, img) values(chart_seq.nextval, '해외 소셜 차트', null);

-- genre
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 발라드', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '해외 팝', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 댄스/일렉', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 알앤비', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 힙합', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '트로트', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '해외 알앤비', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '해외 힙합', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, 'OST/BGM', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '키즈', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 인디', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '클래식', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '뉴에이지', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 팝/어쿠스틱', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '해외 일렉트로닉', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, 'CCM', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '어쿠스틱 팝', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '락', null);

-- artist
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '성시경', 'N', 'M', 1, 'https://cdn.music-flo.com/image/artist/178/001/00/04/400001178_5d0b1718.jpg?1561007897145/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'Billie Eilish', 'N', 'F', 2, 'https://cdn.music-flo.com/image/v2/artist/138/547/00/04/400547138_5fadf299_s.jpg?1605235353486/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'Charlie Puth', 'N', 'M', 2, 'https://cdn.music-flo.com/image/artist/229/212/03/04/403212229_5ef5870e.png?1593149198652/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '방탄소년단', 'Y', 'M', 2, 'https://cdn.music-flo.com/image/v2/artist/567/073/03/04/403073567_5fa8f336_s.jpg?1604907832024/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'BLACKPINK', 'Y', 'F', 2, 'https://cdn.music-flo.com/image/v2/artist/298/956/02/04/402956298_5f769c75_s.jpg?1601608822204/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'Ed Sheeran', 'N', 'M', 2, 'https://cdn.music-flo.com/image/v2/artist/443/097/03/04/403097443_5fe14bdd_s.jpg?1608600541790/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'Taylor Swift', 'N', 'F', 2, 'https://cdn.music-flo.com/image/v2/artist/734/035/03/04/403035734_602a1817_s.jpg?1613371416138/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'Coldplay', 'Y', 'M', 2, 'https://cdn.music-flo.com/image/artist/301/000/00/04/400000301_5db2646f.jpg?1571972209341/dims/resize/500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'Maroon 5', 'Y', 'M', 2, 'https://cdn.music-flo.com/image/artist/637/017/00/04/400017637_5d0b46ab.jpg?1561020076185/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'Adam Levine', 'N', 'M', 2, 'https://cdn.music-flo.com/image/artist/122/053/00/04/400053122_5ca0a04f.jpg?1554030715714/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '이승윤', 'N', 'M', 11, 'https://cdn.music-flo.com/image/artist/284/109/03/04/403109284_5c9da75a.jpg?1553835867817/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '이날치', 'Y', 'A', 18, 'https://cdn.music-flo.com/image/v2/artist/138/079/04/04/404079138_5fa51918_s.jpg?1604655385584/dims/resize/500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '이문세', 'N', 'M', 1, 'https://cdn.music-flo.com/image/artist/436/001/00/04/400001436_5d0b4369.jpg?1561019242012/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '이소라', 'N', 'F', 1, 'https://cdn.music-flo.com/image/artist/798/000/00/04/400000798_5d0b19bb.jpg?1561008572049/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '박효신', 'N', 'M', 1, 'https://cdn.music-flo.com/image/artist/776/000/00/04/400000776_5d0b1cde.jpg?1561009375574/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '김범수', 'N', 'M', 1, 'https://cdn.music-flo.com/image/artist/504/002/00/04/400002504_5d0b1737.jpg?1561007928242/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '나윤권', 'N', 'M', 1, 'https://cdn.music-flo.com/image/artist/860/020/00/04/400020860_5ed45f290.jpg?1590976318798/dims/resize/x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '이수 (엠씨더맥스)', 'N', 'M', 1, 'https://cdn.music-flo.com/image/artist/678/000/00/04/400000678_5c9dac21.jpg?1553837090620/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '임창정', 'N', 'M', 1, 'https://cdn.music-flo.com/image/v2/artist/826/000/00/04/400000826_5f8d257e_s.jpg?1603085697250/dims/resize/x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '임영웅', 'N', 'M', 6, 'https://cdn.music-flo.com/image/v2/artist/209/255/03/04/403255209_6018aa5a_o.jpg?1612229211011/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '영탁', 'N', 'M', 6, 'https://cdn.music-flo.com/image/v2/artist/546/249/03/04/403249546_6022279d_o.jpg?1612851102536/dims/resize/x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '도끼 (Dok2)', 'N', 'M', 5, 'https://cdn.music-flo.com/image/artist/521/018/03/04/403018521_5d0b2a51.jpg?1561012818640/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'BewhY (비와이)', 'N', 'M', 5, 'https://cdn.music-flo.com/image/artist/300/151/03/04/403151300_5d0b2a79.jpg?1561012858745/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '사이먼 도미닉', 'N', 'M', 5, 'https://cdn.music-flo.com/image/artist/487/014/03/04/403014487_5d0b2872.jpg?1561012339196/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '폴킴', 'N', 'M', 4, 'https://cdn.music-flo.com/image/v2/artist/569/170/03/04/403170569_5f96820b_s.jpg?1603699213879/dims/resize/x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '아이유 (IU)', 'N', 'F', 14, 'https://cdn.music-flo.com/image/artist/875/043/03/04/403043875_5eb4b748.jpg?1588901704962/dims/resize/x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '10CM', 'N', 'M', 14, 'https://cdn.music-flo.com/image/v2/artist/528/061/03/04/403061528_5fe2bea0_s.jpg?1608695460522/dims/resize/x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '장범준', 'N', 'M', 14, 'https://cdn.music-flo.com/image/artist/072/104/03/04/403104072_5d0b3ddc.jpg?1561017821523/dims/resize/500x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, '오마이걸 (OH MY GIRL)', 'Y', 'F', 3, 'https://cdn.music-flo.com/image/artist/397/217/03/04/403217397_5e9e7f00.jpg?1587445504550/dims/resize/x500/quality/90');
insert into artist(atseq, name, groupyn, gender, gseq, img) values(artist_seq.nextval, 'SUPER JUNIOR (슈퍼주니어)', 'Y', 'M', 3, 'https://cdn.music-flo.com/image/v2/artist/671/018/03/04/403018671_5f9f8f60_s.jpg?1604292448820/dims/resize/500x500/quality/90');
-- album
insert into album(abseq, atseq, title, img, content, abtype, gseq, pdate) values(album_seq.nextval, 1, 'First Album', 'https://images-na.ssl-images-amazon.com/images/I/61CDjPeGhhL.jpg', '앨범소개', '정규', 15, sysdate);
insert into album(abseq, atseq, title, img, content, abtype, gseq, pdate) values(album_seq.nextval, 2, 'Celebrity', 'https://cdn.music-flo.com/image/v2/album/125/777/05/04/405777125_6010e16c_o.jpg?1611719022486/dims/resize/500x500/quality/90', '아이유(IU) 정규 5집 선공개 <Celebrity>
시선을 끄는 차림과 조금 독특한 취향, 다양한 재능, 낯가림에서 비롯된 방어기제, 매사에 호오가 분명한 성격 등으로 인해 종종 별난 사람 취급을 받아온 친구가 있다.
그 친구의 그런 특징들 때문에 나는 더욱 그 애를 사랑하는데, 본인은 같은 이유로 그동안 미움의 눈초리를 더 많이 받으며 살아왔다고 했다. 
나의 ‘별난 친구’에게 해주고 싶은 말들을 적으며 시작했던 가삿말이었지만 작업을 하다 보니 점점 이건 나의 얘기이기도 하다는 걸 깨달았다. 가사를 완성하고 나니 내 친구나 나뿐만이 아니라 그 누구를 주인공에 대입시켜도 전혀 부자연스럽지 않다는 생각이 들었다. 누구나 살면서 한 번쯤은 내가 남들이 만들어 놓은 기준에 맞지 않는 사람이라는 이유로 소외감을 느껴본 적이 있을 테니까.
내 친구를 포함해 투박하고도 유일하게 태어난 이들에게 말하고 싶다.
당신은 별난 사람이 아니라 별 같은 사람이', '정규', 14, sysdate);
insert into album(abseq, atseq, title, img, content, abtype, gseq, pdate) values(album_seq.nextval, 3, '가로수 그늘 아래 서면', 'https://image.bugsm.co.kr/album/images/500/80216/8021690.jpg', '명곡이다 진짜', '정규', 1, sysdate);
insert into album(abseq, atseq, title, img, content, abtype, gseq, pdate) values(album_seq.nextval, 4, 'The Fifth Season', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/99c08eac-1777-4459-81b0-341be2da5190/dd6iqpj-3f5eda2d-b966-446b-8430-4c34e53c7056.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvOTljMDhlYWMtMTc3Ny00NDU5LTgxYjAtMzQxYmUyZGE1MTkwXC9kZDZpcXBqLTNmNWVkYTJkLWI5NjYtNDQ2Yi04NDMwLTRjMzRlNTNjNzA1Ni5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.bDyj27Y3ogDb_1srZP8QcGyFt_5D3I57S6tfRUSO-sM', '괜찮은듯', '미니', 3, sysdate);	
-- music
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '2|3', '1|2|3', 2, 'Lego House', '엄청난 첫번째노래 정보', 'Y');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn, musicby, lyricsby, producingby) values(music_seq.nextval, 1, 1, '1|2', '1|2', 1, '넌 감동이었어', '미련하게 아무도 모를것 같아<br>태연한척 지내왔어 너 떠나버린뒤<br>다 알았대 어설픈 나의 눈빛은<br>행복했던 지난날의 나와 너무 달라서<br>이별했음을 느낄수 밖에<br>너와 나 정말 그때는 좋았었나봐<br>나 화낼줄도 몰라 내내 즐거웠대<br>그래 그랬었지 널 사랑하기에<br>세상은 나에게 커다란 감동이었어<br>그 순간을 잃는다면 내가  자신이 없어<br>도저히<br>', 'Y', '', '', '');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn, musicby, lyricsby, producingby) values(music_seq.nextval, 1, 1, '1|2', '1|2', 1, '선인장', '눈 뜨지 말아요<br>잠든 채 그냥 있어요<br>그대 눈물 못 본 척 할게요<br>한번만 더 그대의 고운 얼굴을<br>가슴에 새길 수 있게 해줘요<br>날 잡지 말아요<br>내 못난 사랑 안에서<br>그댄 너무 힘들었잖아요<br>내 욕심이 그대를 깨울 수 없게<br>이대로 말없이<br>떠날 수 있게 도와줘요<br>사랑해서 내가 가까이 갈수록<br>그대 맘엔 상처가 깊어져<br>우리는 너무나 닮지 못했죠<br>우리에게 허락된 건<br>그저 바라보는 일<br>거짓을 말할 땐<br>내 눈을 피하던 그댈<br>내가 너무나 잘 알잖아요<br>변함없이 사랑한다는 거짓말<br>오히려 내 맘을<br>병들게 했죠 알잖아요<br>사랑해서 내가 가까이 갈수록<br>그대 맘엔 상처가 깊어져<br>우리는 너무나 닮지 못했죠<br>우리에게 허락된 건<br>그저 바라보는 일<br>혼자 가야 할 그대의 길이<br>힘이 들 땐 나의 이름을 불러요<br>안아줄 수는 없지만<br>그댈 지켜줄 수 있도록<br>가끔씩만 날 찾아줄 순 없나요<br>다른 사람 함께라도 좋아요<br>그대의 모습만 볼 수 있다면<br>괜찮아요 얼마든지<br>견뎌낼 수 있어요<br>나 기다릴게요', 'N', '', '', '');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn, musicby, lyricsby, producingby) values(music_seq.nextval, 1, 1, '1|2', '1|2', 1, '사랑해서 슬픈 날', '무슨 말을 해야 하는지 자꾸만<br>흐르는 눈물 또 참아 내려고<br>그대 사랑 앞에서 괜한 웃음<br>자꾸 보인 건 아닌지<br>너무나 행복해 보여요 그동안<br>나의 곁에선 본적 없던 그대죠<br>너무 쉽게 웃음을 줄 수 있는<br>그대 곁에 사랑이 난 부러워져요<br>술에 취한 척 기대던 떨림도<br>그대 모르게 만들었던 우연도<br>내겐 너무 큰 행복이었나요<br>내겐 그것조차 줄 수 없나요<br>사랑한 순간들을 감춰왔듯이<br>웃으며 보내줘야 하겠죠<br>그대 행복한 모습<br>너무나 바라던 일인데 눈물뿐이죠<br>좋은 사람이길 바래요 눈부신<br>그대 모습을 지켜 줄 수 있도록<br>나와 닮은 슬픔에<br>두 번 다시 그대 울지 않도록<br>나 기도 할게요<br>그대 전화에 잠 못 들던 밤도<br>그대 웃음에 밝아지던 세상도<br>내겐 너무 큰 행복이었나요<br>내겐 그것조차 줄 수 없나요<br>사랑한 순간들을 감춰왔듯이<br>웃으며 보내줘야 하겠죠<br>그대 행복한 모습<br>너무나 바라던 일인데<br>무엇도 달라지는 건 없는거죠<br>영원히 그댈 볼 수 있겠죠<br>항상 그래 왔듯이<br>또 다시 기다릴 수 있죠<br>눈물뿐인 날<br>그대는 모르게<br>', 'N', '', '', '');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn, musicby, lyricsby, producingby) values(music_seq.nextval, 1, 1, '1|2', '1|2', 1, '좋을텐데', '좋을텐데 너의 손 꼭 잡고 그냥<br>이 길을 걸었으면 내겐 너뿐인 걸<br>니가 알았으면 좋을텐데 우<br>얼마 전 만난 남자 얘기<br>오늘만 해도 벌써 몇 번째니<br>그에게 전화가 또 왔었다며<br>조금은 얼굴을 붉히는 너 <br>집에 돌아오는 길은<br>포근한 달빛마저 슬퍼 보여<br>마음이 아파 <br>나를 위로해줄 니가 있다면<br>좋을텐데 너의 손 꼭 잡고 그냥<br>이 길을 걸었으면 내겐 너뿐인 걸<br>니가 알았으면 좋을텐데<br>괜찮은 사람인지 아닌지<br>한번 본 적도 없는 내가 알아<br>그에게 선물을 또 받았다며<br>유난히 행복해 보이는 너 <br>집에 돌아오는 길은<br>포근한 달빛마저 슬퍼 보여<br>마음이 아파 나를 위로해줄<br>니가 있다면 좋을텐데<br>나 아닌 사람 얘기에 때론<br>화도 내어 봤으면 그저 너의 곁에<br>내가 있었으면 좋을텐데<br>모르겠니 애써 지켜온<br>우정마저 놓칠 것만 같아<br>기다리던 또 망설이던 <br>그런 나 이젠 이젠<br>좋을텐데 너의 손 꼭 잡고 그냥<br>이 길을 걸었으면 내겐 너뿐인 걸<br>니가 알았으면 좋을텐데<br>나 아닌 사람 얘기에 때론<br>화도 내어봤으면 그저<br>너의 곁에 내가 있었으면<br>좋을텐데 너의 손 꼭 잡고 그냥<br>이 길을 걸었으면 너뿐인 걸<br>니가 알았으면 좋을텐데<br>나 아닌 사람 얘기에 때론<br>화도 내어봤으면<br>', 'N', '', '', '');

insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 2, 2, '2|6', '1|2', 14, 'Celebrity', '아이유 최신곡', 'Y');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn)values(music_seq.nextval, 3, 3, '1|4', '1|2', 14, '가로수 그늘 아래 서면', '좋다', 'Y');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 3, 3, '1|4', '1|2', 14, '광화문 연가', '규현이 리메이크한게 더 유명함', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 4, 4, '1|4', '1|2', 3, '다섯 번째 계절', '댄스곡인가?', 'Y');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 4, 4, '1|4', '1|2', 3, '소나기', '이건 안들어봄', 'N');

-- bundle_master
insert into bundle_master(bmseq, useq, title, useyn) values (bundle_master_seq.nextval, 0, '그리움 가득한 밤 문득 생각나는 발라드', 'Y');
insert into bundle_master(bmseq, useq, title, useyn) values (bundle_master_seq.nextval, 0, '퇴근길에 신나는 노래', 'Y');
insert into bundle_master(bmseq, useq, title, useyn) values (bundle_master_seq.nextval, 1, '나의 리스트 1', 'Y');
insert into bundle_master(bmseq, useq, title, useyn) values (bundle_master_seq.nextval, 1, '나의 리스트 2', 'Y');

-- bundle_detail
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 1, 1);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 1, 2);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 2, 1);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 2, 2);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 3, 1);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 3, 2);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 4, 1);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 4, 2);

-- taste_master
insert into taste_master(tstmseq, useq, title) values (taste_master_seq.nextval, 1, '첫번째 취향');
insert into taste_master(tstmseq, useq, title) values (taste_master_seq.nextval, 1, '두번째 취향');

-- taste_detail
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, 1, null, null);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, 1, null);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, 2, null);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, 3, null);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, null, 7);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, null, 8);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, null, 9);

-- music_like
insert into music_like(mseq, useq) values(1, 1);
insert into music_like(mseq, useq) values(1, 2);
insert into music_like(mseq, useq) values(1, 3);
insert into music_like(mseq, useq) values(1, 4);
insert into music_like(mseq, useq) values(1, 5);
insert into music_like(mseq, useq) values(1, 6);
insert into music_like(mseq, useq) values(1, 7);
insert into music_like(mseq, useq) values(1, 8);
insert into music_like(mseq, useq) values(1, 9);
insert into music_like(mseq, useq) values(2, 1);
insert into music_like(mseq, useq) values(2, 2);
insert into music_like(mseq, useq) values(2, 3);
insert into music_like(mseq, useq) values(2, 4);
insert into music_like(mseq, useq) values(2, 5);

-- album_like
insert into album_like(abseq, useq) values(1, 1);
insert into album_like(abseq, useq) values(1, 2);
insert into album_like(abseq, useq) values(1, 3);
insert into album_like(abseq, useq) values(1, 4);
insert into album_like(abseq, useq) values(1, 5);
insert into album_like(abseq, useq) values(1, 6);
insert into album_like(abseq, useq) values(1, 7);
insert into album_like(abseq, useq) values(1, 8);
insert into album_like(abseq, useq) values(1, 9);
insert into album_like(abseq, useq) values(2, 1);
insert into album_like(abseq, useq) values(2, 2);
insert into album_like(abseq, useq) values(2, 3);
insert into album_like(abseq, useq) values(2, 4);
insert into album_like(abseq, useq) values(2, 5);

-- artist_like
insert into artist_like(atseq, useq) values(1, 1);
insert into artist_like(atseq, useq) values(1, 2);
insert into artist_like(atseq, useq) values(1, 3);
insert into artist_like(atseq, useq) values(1, 4);
insert into artist_like(atseq, useq) values(1, 5);
insert into artist_like(atseq, useq) values(1, 6);
insert into artist_like(atseq, useq) values(1, 7);
insert into artist_like(atseq, useq) values(1, 8);
insert into artist_like(atseq, useq) values(1, 9);
insert into artist_like(atseq, useq) values(2, 1);
insert into artist_like(atseq, useq) values(2, 2);
insert into artist_like(atseq, useq) values(2, 3);
insert into artist_like(atseq, useq) values(2, 4);
insert into artist_like(atseq, useq) values(2, 5);

-- music_reply
insert into music_reply(rseq, mseq, useq, content) values(music_reply_seq.nextval, 1, 1, '개조아여');
insert into music_reply(rseq, mseq, useq, content) values(music_reply_seq.nextval, 2, 1, '역시... 뒤집어 놓으다.. 음정, 박자.. 와...');

-- music_ban
-- insert into music_ban(useq, mseq) values(1, 1);

-- qna
insert into qna(qseq, useq, title, content) values(qna_seq.nextval, 1, '블루투스 연결은 어떻게 하나요?', '안녕하세요. 해당 웹을 10년간 이용해온 사용자인데요. 혹시 블루투스 연결은 안되나요?');

-- qReply
insert into qReply(qrseq, qseq, aseq, content) values(qReply_seq.nextval, 1, 1, '컴퓨터에 블루투스 장치가 연결되었는지 확인하여주시고, 연결되었음에도 들리지않는다면 해당 장치의 문제이므로 저희사이트와는 무관한 증상입니다.');

-- notice
insert into notice(nseq, title, content) values(notice_seq.nextval, 'title', 'content');