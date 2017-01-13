
# ROUTES FOR COMMENTS ON QUESTIONS

get '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  erb :'questions/comments/show'
end

get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  erb :'comments/show'
end

post '/questions/:id/comments' do
  if session_logged_in?
    @question = Question.find(params[:id])
    @author = session_current_user
    @comment = @question.comments.create(body: params[:comment_body], author_id: @author.id, commentable_id: @question.id, commentable_type: "question" )
  else
    @msgs = "You must be logged in to comment"
  end
  erb :'comments/show'
end

# ROUTES FOR COMMENTS ON ANSWERS

get '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @comments = @answer.comments
  erb :answers
end

get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  @comments = @answer.comments
  erb :'comments/show'
end

post '/answers/:id/comments' do
  if session_logged_in?
    @answer = Answer.find(params[:id])
    @author = session_current_user
    @comment = @answer.comments.create(body: params[:comment_body], author_id: @author.id, commentable_id: @answer.id, commentable_type: "answer" )
  else
    @msgs = "You must be logged in to comment"
  end
  erb :'comments/show'
end
