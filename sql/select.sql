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


select * from music_view where theme like '%1%';

select * from album_view;

select * from bundle_master;