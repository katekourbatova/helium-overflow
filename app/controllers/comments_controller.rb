
# ROUTES FOR COMMENTS ON QUESTIONS

get '/question/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comments = @question.comments
  erb :'questions/comments/show'
end

get '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  erb :'/comments/show'
end

post '/questions/:question_id/comments' do
  if session_logged_in?
    @question = Question.find(params[:question_id])
    @author = session_current_user
    @comment = @question.comments.create(body: params[:comment_body], author_id: @author.id, commentable_id: @question.id, commentable_type: "question" )
  else:
    @msgs = "You must be logged in to comment"
  end
  erb :'/comments/show'
end

# ROUTES FOR COMMENTS ON ANSWERS

get '/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])
  @comments = @answer.comments
  erb :'answers/'
end

get '/answers/:answer_id/comments/new' do
  @answer = Answer.find(params[:answer_id])
  @comments = @answer.comments
  erb :'/comments/show'
end

post '/answers/:answer_id/comments' do
  if session_logged_in?
    @answer = Answer.find(params[:answer_id])
    @author = session_current_user
    @comment = @answer.comments.create(body: params[:comment_body], author_id: @author.id, commentable_id: @answer.id, commentable_type: "answer" )
  else:
    @msgs = "You must be logged in to comment"
  end
  erb :'/comments/show'
end
