package com.eco.admin.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAdminDao {
	public String adminCheck(String adminId);
}