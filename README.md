# Helium

## Members

* Kate
* Stephen
* Pat
* Justin
* Tim

## User Stories [USERS]

* Users can login/logout, and delete their account.

* Users can post questions. Other users can answer them.

* Users can comment on both questions and answers.

* User who posted a question can declare one of the user-submitted answers to be the best answer.

* Users can upvote and downvote questions, answers, and comments—only one vote per user for each question, answer, and comment.

* Users cannot add a question, answer, or comment or vote unless they're logged in, but they can view all of the above when logged out.

## User Stories [QUESTIONS]

* A user can can create a question [as an author].

* A user can view a question.

* A user can vote on a question [up/down]

* Users can delete a question.

## User Stories [VOTES]

* A vote can be an upvote (+1) or a downvote (-1)

* A vote can be on questions, answers or comments 

    * Votes have a polymorphic association with Questions, Answers, and Comments
