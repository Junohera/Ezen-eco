package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.Album;
import com.eco.dto.Artist;
import com.eco.dto.Music;

@Mapper
public interface IMypageDao {
	public List<Music> getMusic(int useq);
	public List<Artist> getArtist(int useq);
	public List<Album> getAlbum(int useq);
}
