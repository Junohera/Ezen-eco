-- member
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno@gmail.com', '1234', 'juno', '010-2172-7798', 'M');

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

-- artist
insert into artist(atseq, name, groupyn, gender, gseq, img, description) values(artist_seq.nextval, 'Ed Sheeran', 'N', 'M', 1, 'https://images.indulgexpress.com/uploads/user/imagelibrary/2019/3/26/original/EdSheeran.jpg', '아티스트 소개');
insert into artist(atseq, name, groupyn, gender, gseq, img, description) values(artist_seq.nextval, '아이유', 'N', 'F', 14, 'https://cdn.music-flo.com/image/artist/875/043/03/04/403043875_5eb4b748.jpg?1588901704962/dims/resize/x500/quality/90', '럭키 신봉선');
insert into artist(atseq, name, groupyn, gender, gseq, img, description) values(artist_seq.nextval, '이문세', 'N', 'M', 14, 'http://topclass.chosun.com/news_img/1907/1907_026.jpg', '말상이라 팬클럽 이름도 마굿간');
insert into artist(atseq, name, groupyn, gender, gseq, img, description) values(artist_seq.nextval, '오마이걸', 'Y', 'M', 3, 'https://static.wikia.nocookie.net/ohmygirl8241/images/e/e0/Nonstop_group_promotional.jpg/revision/latest?cb=20200906115829', '7인조 걸그룹');
-- album
insert into album(abseq, atseq, title, img, content) values(album_seq.nextval, 1, 'First Album', 'https://images-na.ssl-images-amazon.com/images/I/61CDjPeGhhL.jpg', '앨범소개');
insert into album(abseq, atseq, title, img, content) values(album_seq.nextval, 2, 'Celebrity', 'https://cdn.music-flo.com/image/v2/album/125/777/05/04/405777125_6010e16c_o.jpg?1611719022486/dims/resize/500x500/quality/90', '아이유(IU) 정규 5집 선공개 <Celebrity>
시선을 끄는 차림과 조금 독특한 취향, 다양한 재능, 낯가림에서 비롯된 방어기제, 매사에 호오가 분명한 성격 등으로 인해 종종 별난 사람 취급을 받아온 친구가 있다.
그 친구의 그런 특징들 때문에 나는 더욱 그 애를 사랑하는데, 본인은 같은 이유로 그동안 미움의 눈초리를 더 많이 받으며 살아왔다고 했다. 
나의 ‘별난 친구’에게 해주고 싶은 말들을 적으며 시작했던 가삿말이었지만 작업을 하다 보니 점점 이건 나의 얘기이기도 하다는 걸 깨달았다. 가사를 완성하고 나니 내 친구나 나뿐만이 아니라 그 누구를 주인공에 대입시켜도 전혀 부자연스럽지 않다는 생각이 들었다. 누구나 살면서 한 번쯤은 내가 남들이 만들어 놓은 기준에 맞지 않는 사람이라는 이유로 소외감을 느껴본 적이 있을 테니까.
내 친구를 포함해 투박하고도 유일하게 태어난 이들에게 말하고 싶다.
당신은 별난 사람이 아니라 별 같은 사람이');
insert into album(abseq, atseq, title, img, content) values(album_seq.nextval, 3, '가로수 그늘 아래 서면', 'https://image.bugsm.co.kr/album/images/500/80216/8021690.jpg', '명곡이다 진짜');
insert into album(abseq, atseq, title, img, content) values(album_seq.nextval, 4, 'The Fifth Season', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/99c08eac-1777-4459-81b0-341be2da5190/dd6iqpj-3f5eda2d-b966-446b-8430-4c34e53c7056.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvOTljMDhlYWMtMTc3Ny00NDU5LTgxYjAtMzQxYmUyZGE1MTkwXC9kZDZpcXBqLTNmNWVkYTJkLWI5NjYtNDQ2Yi04NDMwLTRjMzRlNTNjNzA1Ni5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.bDyj27Y3ogDb_1srZP8QcGyFt_5D3I57S6tfRUSO-sM', '괜찮은듯');	
-- music
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '2|3', '1|2|3', 2, 'Lego House', '엄청난 첫번째노래 정보', 'Y');
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

-- album_like
insert into album_like(useq, abseq) values(1, 1);

-- artist_like
insert into artist_like(useq, atseq) values(1, 1);

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