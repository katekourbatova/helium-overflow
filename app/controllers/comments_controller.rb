
# ROUTES FOR COMMENTS ON QUESTIONS

get '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  erb :'questions/comments/show'
end

get '/questions/:id/comments/new' do
    @user = session_current_user
  if session_is_current_user?(@user)
    @author = @user
    @question = Question.find(params[:id])
    @commentable_type = "questions"
    @commentable_id = @question.id
    erb :'comments/_form'
  else
    @msgs = ["You must be logged in to comment"]
    erb :'/comments/errors', layout: false
  end
end

post '/questions/:question_id/comments' do
  @author = session_current_user
  if session_is_current_user?(@author)
    @question = Question.find(params[:question_id])

    @comment = @question.comments.create(body: params[:comment_body], author_id: @author.id, commentable_id: @question.id, commentable_type: "question" )
    redirect "/questions/#{@question.id}"
  else
    @msgs = ["You must be logged in to comment"]
     erb :'comments/errors'
  end
end

# get '/questions/:question_id/comments/:id'
# redirect '/questions/:question_id'

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
    p @author = @user
    p @commentable_id = @answer.id
    p @commentable_type = "answers"
    erb :'comments/_form'
  else
    @msgs = ["You must be logged in to comment"]
    erb :'/comments/errors'
  end
end

post '/answers/:answer_id/comments' do
  @author = session_current_user
  if session_is_current_user?(@author)
    p @commentable_id = @answer.id
    p @commentable_type = "answers"
    @answer = Answer.find(params[:answer_id])
    @author = session_current_user
    @comment = @answer.comments.create(body: params[:comment_body], author_id: @author.id, commentable_id: @answer.id, commentable_type: "answer" )
  end
  if session_is_current_user(@author)
    redirect '/answers/:answer_id'
  else
    @msgs = "You must be logged in to comment"
    erb :'/comments/errors'
  end
end
