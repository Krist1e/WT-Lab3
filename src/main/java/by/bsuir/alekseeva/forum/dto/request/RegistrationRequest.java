package by.bsuir.alekseeva.forum.dto.request;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegistrationRequest {
    @Size(min = 3, max = 20, message = "{username.size}")
    @NotNull(message = "{username.not_null}")
    private String username;
    @Email(message = "{email.valid}")
    @NotNull(message = "{email.not_null}")
    private String email;
    @Size(min = 6, max = 20, message = "{password.size}")
    @NotNull(message = "{password.not_null}")
    private String password;
}
