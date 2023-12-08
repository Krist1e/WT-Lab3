package by.bsuir.alekseeva.forum.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user")
public class User implements UserDetails {
    @Id
    @GeneratedValue
    private long id;

    @Column(unique = true)
    private String email;

    @Column(unique = true)
    private String username;

    @ToString.Exclude
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role = Role.USER;

    @OneToMany(mappedBy = "author")
    private transient List<Question> questions;

    @OneToMany(mappedBy = "author")
    private transient List<Answer> answers;

    private LocalDateTime registrationDate;

    boolean isAccountNonExpired = true;
    boolean isAccountNonLocked = true;
    boolean isCredentialsNonExpired = true;
    boolean isEnabled = true;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(role.name()));
    }

    public int getRating() {
        return answers.stream().mapToInt(Answer::getRating).sum();
    }
}
