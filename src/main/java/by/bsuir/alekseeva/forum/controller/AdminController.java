package by.bsuir.alekseeva.forum.controller;

import by.bsuir.alekseeva.forum.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private static final int PAGE_SIZE = 10;

    private final UserService userService;

    @GetMapping("/users")
    public String users(@RequestParam(defaultValue = "0") int page, Model model) {
        model.addAttribute("users", userService.getAllUsers(page, PAGE_SIZE));
        return "users";
    }

    @PostMapping("/users/ban")
    public String banUser(@RequestParam long id) {
        userService.banUser(id);
        return "redirect:/admin/users";
    }

    @PostMapping("/users/unban")
    public String unbanUser(@RequestParam long id) {
        userService.unbanUser(id);
        return "redirect:/admin/users";
    }
}
