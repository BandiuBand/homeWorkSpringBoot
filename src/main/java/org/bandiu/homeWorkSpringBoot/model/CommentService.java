package org.bandiu.homeWorkSpringBoot.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.ArrayList;
import java.util.List;

@Service
public class CommentService {


    @Autowired
    private CommentRepository commentRepository;

    public void saveComment(Comment comment){

        comment.setCreatedDate(Date.valueOf(String.valueOf(LocalDateTime.now())));
        commentRepository.save(comment);
    }


    public Page<Comment> getPaginatedComments(int page, int pageSize) {
        Pageable pageable = PageRequest.of(page,pageSize, Sort.by("createdDate").descending());
        Page<Comment> pages = commentRepository.findAll(pageable);
        return pages;
    }
}
