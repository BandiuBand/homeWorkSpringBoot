package org.bandiu.homeWorkSpringBoot.model;


import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "comment")
public class Comment {
    private String name;
    private String content;
    private int rating;
    private String createdDate;
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    public void setName(String name) {
        this.name = name;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getName() {
        return name;
    }

    public String getContent() {
        return content;
    }

    public int getRating() {
        return rating;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
