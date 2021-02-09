package com.eco.dto;

import java.sql.Timestamp;
import java.util.List;

<<<<<<< HEAD
=======
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
import lombok.Data;

@Data
public class Bundle {
    private int bmseq;
    private int useq;
<<<<<<< HEAD
=======
    @NotEmpty(message = "title is not empty")
    @NotBlank(message = "title is not blank")
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
    private String title;
    private String useyn;
    private Timestamp cdate;

    private List<Music> musicList;
}
