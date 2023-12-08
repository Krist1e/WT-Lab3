package by.bsuir.alekseeva.forum.repository;

import by.bsuir.alekseeva.forum.entity.View;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ViewRepository extends JpaRepository<View, Long> {
    Optional<View> findByQuestionIdAndUserId(long questionId, long userId);
}
