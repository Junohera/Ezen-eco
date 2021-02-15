/*
    스크래핑 순서
    
    1. 아티스트 정보
        artistInfo로 얻고

    2. 앨범상세 
        albumInfo로 얻고

    3. 앨범상세에서 수록곡 수집

*/

var artistInfo = {
    name : document.querySelector(".bagde_area .badge_track_info .artist").textContent.trim(),
    groupyn : (function() {
        var grouplabel = document.querySelector(".bagde_area .badge_track_info dl").getElementsByTagName("dd")[0].textContent.trim()
        if (grouplabel === "솔로")
            return "N";
        else if (grouplabel === "그룹") 
            return "Y";
        else
            return null;
    })(),
    gender : (function() {
        var genderLabel = document.querySelector(".bagde_area .badge_track_info dl").getElementsByTagName("dd")[1].textContent.trim();
        if (genderLabel === "남성") return "M";
        else if (genderLabel === "여성") return "F";
        else return "A";
    })(),
    genre : document.querySelector(".bagde_area .badge_track_info dl").getElementsByTagName("dd")[2].textContent.split(",")[0].trim(),
    img : (function() {
        var url = document.querySelector(".bagde_area .link_thumbnail").style.backgroundImage;
        url = url.substring(5, url.length - 2);
        return url;
    })()

}

var musicListAtArtist = {
    tr : document.querySelector(".track_list_table").getElementsByTagName("tbody")[0].getElementsByTagName("tr")
};
