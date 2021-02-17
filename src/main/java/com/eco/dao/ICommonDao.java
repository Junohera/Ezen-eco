package com.eco.dao;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.search.SearchDTO;

@Mapper
public interface ICommonDao {
	int count(SearchDTO search);
}
