package org.bandiu.homeWorkSpringBoot.controller;

import org.bandiu.homeWorkSpringBoot.model.Comment;
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

    @GetMapping
    public String showGuestBook(Model model){
        List<Comment> comments  = new ArrayList<>();//toDo need implement read from DB
        model.addAttribute("comments",comments);
        return "guestbook";//toDo need make template FreeMarker
    }

    @PostMapping
    public String addComment(Comment comment){
        //todo commentService -> save

        return "redirect:/guestbook";
    }
}
