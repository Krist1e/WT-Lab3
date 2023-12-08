package by.bsuir.alekseeva.forum.repository;

import by.bsuir.alekseeva.forum.entity.Answer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnswerRepository extends JpaRepository<Answer, Long> {
    List<Answer> findAllByQuestionId(long questionId);
    Page<Answer> findAllByQuestionId(long questionId, Pageable pageable);
    List<Answer> findAllByAuthorId(long authorId);
    Page<Answer> findAllByAuthorId(long authorId, Pageable pageable);
}
