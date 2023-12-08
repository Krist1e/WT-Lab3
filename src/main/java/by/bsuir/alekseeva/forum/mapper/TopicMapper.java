package by.bsuir.alekseeva.forum.mapper;

import by.bsuir.alekseeva.forum.dto.request.TopicRequest;
import by.bsuir.alekseeva.forum.entity.Topic;
import by.bsuir.alekseeva.forum.service.UserService;
import org.mapstruct.Context;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface TopicMapper {
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "author", expression = "java(userService.getUserByUsername(authorName))")
    @Mapping(target = "name", source = "title")
    @Mapping(target = "creationTime", expression = "java(java.time.LocalDateTime.now())")
    Topic toEntity(TopicRequest topicRequest, @Context UserService userService, @Context String authorName);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "author", ignore = true)
    @Mapping(target = "name", source = "title")
    @Mapping(target = "creationTime", ignore = true)
    Topic updateTopic(TopicRequest topicRequest, @MappingTarget Topic topic);
}
