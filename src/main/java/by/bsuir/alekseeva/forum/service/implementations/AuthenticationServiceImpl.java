package by.bsuir.alekseeva.forum.service.implementations;

import by.bsuir.alekseeva.forum.dto.request.AuthenticationRequest;
import by.bsuir.alekseeva.forum.dto.request.RegistrationRequest;
import by.bsuir.alekseeva.forum.service.AuthenticationService;
import by.bsuir.alekseeva.forum.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticationServiceImpl implements AuthenticationService {

    private final UserService userService;
    private final AuthenticationManager authenticationManager;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void authenticate(AuthenticationRequest authenticationRequest) {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            authenticationRequest.getUsername(),
                            passwordEncoder.encode(authenticationRequest.getPassword())
                    ));
        } catch (BadCredentialsException e) {
            throw new IllegalArgumentException("Invalid username or password");
        }
    }

    @Override
    public void register(RegistrationRequest registrationRequest) {
        if (userService.isUserExists(registrationRequest.getUsername(), registrationRequest.getEmail())) {
            throw new IllegalArgumentException("User with such username or email already exists");
        }
        userService.addUser(registrationRequest.getUsername(),
                passwordEncoder.encode(registrationRequest.getPassword()),
                registrationRequest.getEmail());
    }
}
