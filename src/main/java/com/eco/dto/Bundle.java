package com.eco.dto;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class Bundle {
    private int bmseq;
    private int useq;
    private String title;
    private String useyn;
    private Timestamp cdate;
    private List<Music> musicList;
}
