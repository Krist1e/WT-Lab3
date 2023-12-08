package by.bsuir.alekseeva.forum.dto.request;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AnswerRequest {
    private long questionId;
    @NotEmpty(message = "Text cannot be empty")
    @NotEmpty(message = "Text cannot be blank")
    private String text;
}
