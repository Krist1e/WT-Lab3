package by.bsuir.alekseeva.forum.mapper;

import by.bsuir.alekseeva.forum.dto.request.AnswerRequest;
import by.bsuir.alekseeva.forum.entity.Answer;
import by.bsuir.alekseeva.forum.service.QuestionService;
import by.bsuir.alekseeva.forum.service.UserService;
import org.mapstruct.Context;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface AnswerMapper {

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "text", source = "text")
    @Mapping(target = "author", expression = "java(userService.getUserByUsername(authorName))")
    @Mapping(target = "question", expression = "java(questionService.getQuestion(answerRequest.getQuestionId()))")
    @Mapping(target = "answerTime", expression = "java(java.time.LocalDateTime.now())")
    Answer toEntity(AnswerRequest answerRequest,
                    @Context QuestionService questionService,
                    @Context UserService userService,
                    @Context String authorName);
}
