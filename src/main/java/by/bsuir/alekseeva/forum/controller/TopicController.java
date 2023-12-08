package by.bsuir.alekseeva.forum.controller;

import by.bsuir.alekseeva.forum.dto.request.QuestionRequest;
import by.bsuir.alekseeva.forum.dto.request.TopicRequest;
import by.bsuir.alekseeva.forum.service.QuestionService;
import by.bsuir.alekseeva.forum.service.TopicService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class TopicController {

    private static final int PAGE_SIZE = 10;

    private final TopicService topicService;
    private final QuestionService questionService;

    @GetMapping("/topic/{id}")
    public String topic(@RequestParam(defaultValue = "0") int page, @PathVariable long id, Model model) {
        model.addAttribute("question", new QuestionRequest());
        model.addAttribute("topics", topicService.getAllTopics(page, PAGE_SIZE));
        model.addAttribute("questions", questionService.getAllQuestionsByTopic(id, page, PAGE_SIZE));
        model.addAttribute("topic", topicService.getTopic(id));
        return "topic";
    }

    @GetMapping("/topics")
    public String topics(@RequestParam(defaultValue = "0") int page, Model model) {
        model.addAttribute("topic", new TopicRequest());
        model.addAttribute("question", new QuestionRequest());
        model.addAttribute("topics", topicService.getAllTopics(page, PAGE_SIZE));
        return "topics";
    }

    @PostMapping("/topic")
    public String addTopic(@Valid @ModelAttribute("topic") TopicRequest topicRequest, Principal principal) {
        topicService.addTopic(topicRequest, principal.getName());
        return "redirect:/topics";
    }

    @DeleteMapping("/topic/{id}")
    public String deleteTopic(@PathVariable long id) {
        topicService.deleteTopic(id);
        return "redirect:/topics";
    }

    @PutMapping("/topic/{id}")
    public String updateTopic(@PathVariable long id, @Valid @ModelAttribute("topic") TopicRequest topicRequest) {
        topicService.updateTopic(id, topicRequest);
        return "redirect:/topics";
    }
}
