
# ROUTES FOR COMMENTS ON QUESTIONS

get '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  erb :'questions/comments/show'
end

get '/questions/:id/comments/new' do
    @user = session_current_user
  if session_is_current_user?(@user)
    @question = Question.find(params[:id])
    @commentable_id = @question.id
    erb :'comments/_form'
  else
    @msgs = ["You must be logged in to comment"]
    erb :'/comments/errors'
  end
end

post '/questions/:id/comments' do
  @user = session_current_user
  if session_is_current_user (@user)
    @comment = @question.comments.create(body: params[:comment_body], author_id: @author.id, commentable_id: @question.id, commentable_type: "question" )
      erb :'/comments/show'
  else
    @msgs = ["You must be logged in to comment"]
     erb :'comments/errors'
  end
end

# ROUTES FOR COMMENTS ON ANSWERS

get '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @comments = @answer.comments
  erb :answers
end

get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  @user = session_current_user
  if session_is_current_user?(@user)
    @commentable_id = @answer.id
    erb :'comments/_form'
  else
    @msgs = ["You must be logged in to comment"]
    erb :'/comments/errors'
  end
end

post '/answers/:id/comments' do
    @answer = Answer.find(params[:id])
    @author = session_current_user
    @comment = @answer.comments.create(body: params[:comment_body], author_id: @author.id, commentable_id: @answer.id, commentable_type: "answer" )
  if session_is_current_user(@author)
    erb :'comments/show'
  else
    @msgs = "You must be logged in to comment"
    erb :'/comments/errors'
  end
end
