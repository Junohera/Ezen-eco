select * from music_view order by mseq desc;


select 
    m.mseq
    , m.title
    , m.content
    , m.gseq
    , m.titleyn
    , m.theme
    , ab.abseq
    , ab.title as abtitle
    , ab.img as abimg
    , ab.content as abcontent
    , ab.pdate as pdate
    , at.atseq
    , at.name
    , at.groupyn
    , at.gender
    , at.gseq as atgseq
    , at.img as atimg
    , at.description as genre
from music m
    left join album ab
    on m.abseq = ab.abseq
    left join artist at
    on at.atseq = m.atseq and at.atseq = ab.atseq;


select * from music_view;

select * from album_view;

select * from bundle_master;

select * from music_view where theme like '%'||3||'%'
		order by mseq desc;



select * from BUNDLE_MASTER;
select * from BUNDLE_DETAIL;

select * from music_ban;


select * from music;

select * from album;

update album set img = 'https://cdn.music-flo.com/image/v2/album/125/777/05/04/405777125_6010e16c_o.jpg?1611719022486/dims/resize/500x500/quality/90';
ALTER TABLE album MODIFY content varchar2(3000);
select * from album;

update album set content = '아이유(IU) 정규 5집 선공개 <Celebrity>
시선을 끄는 차림과 조금 독특한 취향, 다양한 재능, 낯가림에서 비롯된 방어기제, 매사에 호오가 분명한 성격 등으로 인해 종종 별난 사람 취급을 받아온 친구가 있다.
그 친구의 그런 특징들 때문에 나는 더욱 그 애를 사랑하는데, 본인은 같은 이유로 그동안 미움의 눈초리를 더 많이 받으며 살아왔다고 했다. 
나의 ‘별난 친구’에게 해주고 싶은 말들을 적으며 시작했던 가삿말이었지만 작업을 하다 보니 점점 이건 나의 얘기이기도 하다는 걸 깨달았다. 가사를 완성하고 나니 내 친구나 나뿐만이 아니라 그 누구를 주인공에 대입시켜도 전혀 부자연스럽지 않다는 생각이 들었다. 누구나 살면서 한 번쯤은 내가 남들이 만들어 놓은 기준에 맞지 않는 사람이라는 이유로 소외감을 느껴본 적이 있을 테니까.
내 친구를 포함해 투박하고도 유일하게 태어난 이들에게 말하고 싶다.
당신은 별난 사람이 아니라 별 같은 사람이';
