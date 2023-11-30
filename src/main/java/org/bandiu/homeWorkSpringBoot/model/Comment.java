package org.bandiu.homeWorkSpringBoot.model;


import java.util.Date;

public class Comment {
    private String name;
    private String comment;
    private int rating;
    private Date data;

    public void setName(String name) {
        this.name = name;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getName() {
        return name;
    }

    public String getComment() {
        return comment;
    }

    public int getRating() {
        return rating;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
}
