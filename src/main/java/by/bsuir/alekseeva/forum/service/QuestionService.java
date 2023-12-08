package by.bsuir.alekseeva.forum.service;


import by.bsuir.alekseeva.forum.dto.request.QuestionRequest;
import by.bsuir.alekseeva.forum.entity.Question;
import org.springframework.data.domain.Page;

import java.util.List;

public interface QuestionService {
    Question addQuestion(QuestionRequest questionRequest, String authorName);

    boolean deleteQuestion(long id);

    Question updateQuestion(QuestionRequest questionRequest, long id);

    Question getQuestion(long id);

    Page<Question> getAllQuestions(int page, int pageSize);

    List<Question> getAllQuestions();

    Page<Question> getAllQuestionsByTopic(long topicId, int page, int pageSize);

    List<Question> getAllQuestionsByTopic(long topicId);

    Page<Question> getAllQuestionsByAuthor(long authorId, int page, int pageSize);

    List<Question> getAllQuestionsByAuthor(long authorId);

    boolean addView(long questionId, long userId);
}
