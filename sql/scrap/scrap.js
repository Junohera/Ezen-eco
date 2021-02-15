var scrap = {};

scrap['artist'] = {
    required: [
        "name",
        "groupyn",
        "gender",
        "genre",
        "img",
    ]
    , get: function() {
        return this.required.map( (v, i) => {
            return this[v];
        }).join(", ");
    }
    , name : document.querySelector(".bagde_area .badge_track_info .artist").textContent.trim()
    , groupyn : (function() {
        var grouplabel = document.querySelector(".bagde_area .badge_track_info dl").getElementsByTagName("dd")[0].textContent.trim()
        if (grouplabel === "솔로")
            return "N";
        else if (grouplabel === "그룹") 
            return "Y";
        else
            return null;
    })()
    , gender : (function() {
        var genderLabel = document.querySelector(".bagde_area .badge_track_info dl").getElementsByTagName("dd")[1].textContent.trim();
        if (genderLabel === "남성") return "M";
        else if (genderLabel === "여성") return "F";
        else return "A";
    })()
    , genre : document.querySelector(".bagde_area .badge_track_info dl").getElementsByTagName("dd")[2].textContent.split(",")[0].trim()
    , img : (function() {
        var url = document.querySelector(".bagde_area .link_thumbnail").style.backgroundImage;
        url = url.substring(5, url.length - 2);
        return url;
    })()
};

scrap['album'] = {
    required: [
        // "abseq",
        // "atseq",
        "title",
        "img",
        "content",
        "abtype",
        "gseq",
        "pdate", // YYYY.MM.dd
    ]
    , get: function() {
        return this.required.map( (v, i) => {
            return this[v];
        }).join(", ");
    }
    , title: (function() {
        return "";
    })()
    , img : (function() {
        return document.querySelector(".link_thumbnail img").src;
    })()
    , content : (function() {
        return "";
    })()
    , abtype : (function() {
        return "";
    })()
    , gseq : (function() {
        return "";
    })()
    , pdate : (function() {
        return "";
    })()
};
    
copy(scrap.artist.get()); // 개발자도구에서 사용시 클립보드에 저장