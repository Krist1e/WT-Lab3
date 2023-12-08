package by.bsuir.alekseeva.forum.service.implementations;

import by.bsuir.alekseeva.forum.entity.Role;
import by.bsuir.alekseeva.forum.entity.User;
import by.bsuir.alekseeva.forum.repository.UserRepository;
import by.bsuir.alekseeva.forum.service.UserService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Override
    public User addUser(String username, String password, String email) {
        return userRepository.saveAndFlush(
                User.builder()
                        .username(username)
                        .password(password)
                        .email(email)
                        .role(Role.USER)
                        .registrationDate(LocalDateTime.now())
                        .isEnabled(true)
                        .isAccountNonLocked(true)
                        .isAccountNonExpired(true)
                        .isCredentialsNonExpired(true)
                        .build());
    }

    @Override
    public User getUserById(long id) {
        return userRepository.findById(id).orElseThrow(
                () -> new EntityNotFoundException("User with id " + id + " not found")
        );
    }

    @Override
    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username).orElseThrow(
                () -> new EntityNotFoundException("User with username " + username + " not found")
        );
    }

    @Override
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email).orElseThrow(
                () -> new EntityNotFoundException("User with email " + email + " not found")
        );
    }


    @Override
    public Page<User> getAllUsers(int page, int pageSize) {
        return userRepository.findAll(PageRequest.of(page, pageSize));
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public void banUser(long id) {
        User user = getUserById(id);
        user.setAccountNonLocked(false);
    }

    @Override
    public void unbanUser(long id) {
        User user = getUserById(id);
        user.setAccountNonLocked(true);
    }

    @Override
    public boolean isUserExists(String username, String email) {
        return userRepository.findByUsername(username).isPresent() ||
                userRepository.findByEmail(email).isPresent();
    }
}
