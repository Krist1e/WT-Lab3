package by.bsuir.alekseeva.forum.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "question")
public class Question {
    @Id
    @GeneratedValue
    private long id;

    private String title;
    private String text;

    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
    private List<View> views;

    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
    private List<Answer> answers;

    @ManyToOne
    private User author;

    @ManyToOne
    private Topic topic;

    private LocalDateTime askTime;
    private LocalDateTime lastUpdateTime;

    public int getViewsCount() {
        return views.size();
    }

    public int getAnswersCount() {
        return answers.size();
    }
}
