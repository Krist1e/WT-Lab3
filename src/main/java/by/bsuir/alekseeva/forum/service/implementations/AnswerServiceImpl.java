package by.bsuir.alekseeva.forum.service.implementations;

import by.bsuir.alekseeva.forum.dto.request.AnswerRequest;
import by.bsuir.alekseeva.forum.entity.Answer;
import by.bsuir.alekseeva.forum.mapper.AnswerMapper;
import by.bsuir.alekseeva.forum.service.AnswerService;
import by.bsuir.alekseeva.forum.service.QuestionService;
import by.bsuir.alekseeva.forum.repository.AnswerRepository;
import by.bsuir.alekseeva.forum.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AnswerServiceImpl implements AnswerService {

    private final UserService userService;
    private final QuestionService questionService;
    private final AnswerRepository answerRepository;
    private final AnswerMapper answerMapper;

    @Override
    public Answer addAnswer(AnswerRequest answerRequest, String authorName) {
        return Optional.of(answerRequest)
                .map(request -> answerMapper.toEntity(request, questionService, userService, authorName))
                .map(answerRepository::saveAndFlush)
                .orElseThrow();
    }

    @Override
    public Answer getAnswer(long id) {
        return answerRepository.findById(id).orElseThrow();
    }

    @Override
    public Page<Answer> getAllAnswers(int page, int pageSize) {
        return answerRepository.findAll(PageRequest.of(page, pageSize));
    }

    @Override
    public List<Answer> getAllAnswers() {
        return answerRepository.findAll();
    }

    @Override
    public Page<Answer> getAllAnswersByQuestion(long questionId, int page, int pageSize) {
        return answerRepository.findAllByQuestionId(questionId, PageRequest.of(page, pageSize));
    }

    @Override
    public List<Answer> getAllAnswersByQuestion(long questionId) {
        return answerRepository.findAllByQuestionId(questionId);
    }

    @Override
    public Page<Answer> getAllAnswersByAuthor(long authorId, int page, int pageSize) {
        return answerRepository.findAllByAuthorId(authorId, PageRequest.of(page, pageSize));
    }

    @Override
    public List<Answer> getAllAnswersByAuthor(long authorId) {
        return answerRepository.findAllByAuthorId(authorId);
    }
}
