package org.bandiu.homeWorkSpringBoot.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    public void saveComment(Comment comment){
        //toDo
    }

    public List<Comment> getAllComments(){
        return new ArrayList<Comment>();//toDo
    }

    public Page<Comment> getPaginatedComments(int page, int pageSize) {
        Pageable pageable = PageRequest.of(page,pageSize);
        Page<Comment> pages = commentRepository.findAll(pageable);
        return pages;
    }
}
