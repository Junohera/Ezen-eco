package com.eco.dto;

import java.sql.Timestamp;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class Bundle {
    private int bmseq;
    private int useq;
    @NotEmpty(message = "title is not empty")
    @NotBlank(message = "title is not blank")
    private String title;
    private String useyn;
    private Timestamp cdate;

    private List<Music> musicList;
}
