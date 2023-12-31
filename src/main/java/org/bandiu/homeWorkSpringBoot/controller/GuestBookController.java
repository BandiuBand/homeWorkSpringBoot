package org.bandiu.homeWorkSpringBoot.controller;

import org.bandiu.homeWorkSpringBoot.model.Comment;
import org.bandiu.homeWorkSpringBoot.model.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.data.domain.Page;

import java.time.LocalDateTime;
import java.util.List;


@Controller
@RequestMapping("/guestbook")
public class GuestBookController {
    private final int pageSize = 5;

    @Autowired
    CommentService commentService;

    @GetMapping
    public String showGuestBook(@RequestParam(name = "page",defaultValue = "0") int page, Model model){
        Page<Comment> commentPage = commentService.getPaginatedComments(page,pageSize);
        List<Comment> comments = commentPage.getContent();
        model.addAttribute("currentPage",page);
        model.addAttribute("totalPages",commentPage.getTotalElements());
        model.addAttribute("comments",comments);
        return "guestbook";//toDo need make template FreeMarker
    }

    @PostMapping
    public String addComment(Comment comment){
        commentService.saveComment(comment);
        return "redirect:/guestbook";
    }
}
