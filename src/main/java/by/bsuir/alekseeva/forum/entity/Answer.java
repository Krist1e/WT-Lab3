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
@Table(name = "answer")
public class Answer {
    @Id
    @GeneratedValue
    private long id;
    private String text;

    @ManyToOne
    private User author;

    @ManyToOne
    private Question question;

    @OneToMany(mappedBy = "answer", cascade = CascadeType.ALL)
    private List<Vote> votes;

    private LocalDateTime answerTime;

    public int getRating() {
        return votes.stream().mapToInt(Vote::getValue).sum();
    }
}