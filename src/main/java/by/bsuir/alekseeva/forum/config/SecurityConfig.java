package by.bsuir.alekseeva.forum.config;

import by.bsuir.alekseeva.forum.entity.Role;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final AuthenticationProvider authenticationProvider;

    @Bean
    public SecurityFilterChain securityWebFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .csrf(Customizer.withDefaults())
                .authenticationProvider(authenticationProvider)
                .authorizeHttpRequests(requests -> requests
                        .requestMatchers("/question/**").hasAnyAuthority(Role.USER.name(), Role.ADMIN.name())
                        .requestMatchers("/profile/**").hasAnyAuthority(Role.USER.name(), Role.ADMIN.name())
                        .requestMatchers("/topic/**").hasAnyAuthority(Role.USER.name(), Role.ADMIN.name())
                        .requestMatchers("/topics").hasAnyAuthority(Role.USER.name(), Role.ADMIN.name())
                        .requestMatchers("/admin/**").hasAuthority(Role.ADMIN.name())
                        .anyRequest().permitAll())
                .formLogin(customizer -> customizer
                        .loginPage("/login")
                        .loginProcessingUrl("/login")
                        .defaultSuccessUrl("/")
                        .failureUrl("/login?error=true")
                        .usernameParameter("username")
                        .passwordParameter("password")
                        .permitAll())
                .logout(customizer -> customizer
                        .logoutUrl("/logout"));

        return httpSecurity.build();
    }
}
