package org.bandiu.homeWorkSpringBoot.controller;

import org.bandiu.homeWorkSpringBoot.model.Comment;
import org.bandiu.homeWorkSpringBoot.model.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/guestbook")
public class GuestBoockController {

    @Autowired
    CommentService commentService;

    @GetMapping
    public String showGuestBook(Model model){
        List<Comment> comments  = commentService.getAllComments();
        model.addAttribute("comments",comments);
        return "guestbook";//toDo need make template FreeMarker
    }

    @PostMapping
    public String addComment(Comment comment){
        commentService.saveComment(comment);
        return "redirect:/guestbook";
    }
}
