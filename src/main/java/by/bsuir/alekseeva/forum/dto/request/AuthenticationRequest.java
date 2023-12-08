package by.bsuir.alekseeva.forum.dto.request;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthenticationRequest {
    @NotNull(message = "{username.not_null}")
    private String username;
    @NotNull(message = "{password.not_null}")
    private String password;
}
