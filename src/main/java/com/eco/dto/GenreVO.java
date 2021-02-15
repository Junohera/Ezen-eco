package com.eco.dto;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class GenreVO {
    private int gseq;
    @NotEmpty
    private String title;
    private String img;
}