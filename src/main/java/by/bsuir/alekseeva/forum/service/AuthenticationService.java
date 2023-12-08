package by.bsuir.alekseeva.forum.service;

import by.bsuir.alekseeva.forum.dto.request.AuthenticationRequest;
import by.bsuir.alekseeva.forum.dto.request.RegistrationRequest;

public interface AuthenticationService {
    void authenticate(AuthenticationRequest authenticationRequest);
    void register(RegistrationRequest registrationRequest);
}
