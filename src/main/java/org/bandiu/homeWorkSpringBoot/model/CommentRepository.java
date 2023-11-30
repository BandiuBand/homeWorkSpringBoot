package org.bandiu.homeWorkSpringBoot.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CommentRepository extends JpaRepository<Comment,Long> {
    Page<Comment> findAll(Pageable pageable);

    //toDo
}
