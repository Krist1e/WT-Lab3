package by.bsuir.alekseeva.forum.service;


import by.bsuir.alekseeva.forum.entity.Vote;

import java.util.Optional;

public interface VoteService {
    void upvote(long answerId, String username);

    void downvote(long answerId, String username);

    void unvote(long answerId, String username);

    Optional<Vote> getVote(long answerId, String username);
}
