package by.bsuir.alekseeva.forum.service.implementations;

import by.bsuir.alekseeva.forum.dto.request.QuestionRequest;
import by.bsuir.alekseeva.forum.entity.Question;
import by.bsuir.alekseeva.forum.entity.View;
import by.bsuir.alekseeva.forum.mapper.QuestionMapper;
import by.bsuir.alekseeva.forum.service.QuestionService;
import by.bsuir.alekseeva.forum.service.TopicService;
import by.bsuir.alekseeva.forum.repository.QuestionRepository;
import by.bsuir.alekseeva.forum.repository.ViewRepository;
import by.bsuir.alekseeva.forum.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class QuestionServiceImpl implements QuestionService {

    private final UserService userService;
    private final TopicService topicService;
    private final QuestionRepository questionRepository;
    private final ViewRepository viewRepository;
    private final QuestionMapper questionMapper;

    @Override
    public Question addQuestion(QuestionRequest questionRequest, String authorName) {
        return Optional.of(questionRequest)
                .map(question -> questionMapper.toEntity(question,
                        topicService,
                        userService,
                        authorName))
                .map(questionRepository::saveAndFlush)
                .orElseThrow();
    }

    @Override
    public boolean deleteQuestion(long id) {
        return questionRepository.findById(id)
                .map(question -> {
                    questionRepository.delete(question);
                    return true;
                })
                .orElse(false);
    }

    @Override
    public Question updateQuestion(QuestionRequest questionRequest, long id) {
        return questionRepository.findById(id)
                .map(question -> questionMapper.updateEntity(questionRequest,
                        userService,
                        question.getAuthor().getUsername(),
                        question))
                .map(questionRepository::saveAndFlush)
                .orElseThrow();
    }

    @Override
    public Question getQuestion(long id) {
        return questionRepository.findById(id)
                .orElseThrow();
    }

    @Override
    public Page<Question> getAllQuestions(int page, int pageSize) {
        return questionRepository.findAll(PageRequest.of(page, pageSize));
    }

    @Override
    public List<Question> getAllQuestions() {
        return questionRepository.findAll();
    }

    @Override
    public Page<Question> getAllQuestionsByTopic(long topicId, int page, int pageSize) {
        return questionRepository.findAllByTopicId(topicId, PageRequest.of(page, pageSize));
    }

    @Override
    public List<Question> getAllQuestionsByTopic(long topicId) {
        return questionRepository.findAllByTopicId(topicId);
    }

    @Override
    public Page<Question> getAllQuestionsByAuthor(long authorId, int page, int pageSize) {
        return questionRepository.findAllByAuthorId(authorId, PageRequest.of(page, pageSize));
    }

    @Override
    public List<Question> getAllQuestionsByAuthor(long authorId) {
        return questionRepository.findAllByAuthorId(authorId);
    }

    @Override
    public boolean addView(long questionId, long userId) {
        return viewRepository.findByQuestionIdAndUserId(questionId, userId)
                .map(view -> false)
                .orElseGet(() -> {
                    viewRepository.saveAndFlush(
                            View.builder()
                                    .question(questionRepository.findById(questionId).orElseThrow())
                                    .user(userService.getUserById(userId))
                                    .build()
                    );
                    return true;
                });
    }
}
