<div id="playListBox">
    <div id="pLn">재생목록</div>
    <div id="playListBoxClose" onclick="pBoxX()">
        <i class="fas fa-times fa-2x"></i>
    </div>
    <div id="audioBox">
    </div>
    <div id="playList">
        <table id="recommendChart">
                    <%-- <c:forEach items="${bundleList }" var="bundle" begin="${status.index}" end="${status.index}">
                            <c:forEach items="${bundle.musicList }" var="music" begin="0" end="3"> --%>
                                        <tr>
                                            <td class="albumS">
                                                <a href="musicView?mseq=${music.mseq}">
                                                    <div class="albumImg">		
                                                            img <%-- <img src="${music.abimg}"> --%>
                                                    </div>
                                                </a>
                                            </td>
                                                <td class="MusicT">
                                                    <a href="musicView?mseq=${music.mseq}">
                                                        title (${music.title })
                                                    </a>
                                                </td>
                                            <td class="MusicA">
                                                <a href="artistView?atseq=${music.atseq}">
                                                    name (${music.name })
                                                </a>
                                            </td>
                                        </tr>
                            <%-- </c:forEach>
                    </c:forEach> --%>
                </table>
    </div>
</div>