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

select 
	at.*
	, g.titl as gtitle
from artist at
	join genre g
		on at.gseq = g.gseq;
		
select * from member;

-- 특정유저가 좋아요를 누른 곡목록을 최신별로 조회  
select * from
music m, album ab, artist at, music_like ml
where
    m.abseq = ab.abseq
    and m.atseq = at.atseq
    and ml.mseq = m.mseq
and ml.useq = 1
order by cdate desc;

-- 좋아요한 음악들을 유저별 생성시간별로 정렬하여 조회
select * from music_like order by useq desc, cdate desc;