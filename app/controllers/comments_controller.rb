
# ROUTES FOR COMMENTS ON QUESTIONS

get '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  erb :'questions/comments/show'
end

get '/questions/:id/comments/new' do
  session_require_login!

    @user = session_current_user
    @question = Question.find(params[:id])
    @commentable_type = "questions"
    @commentable_id = @question.id
  if request.xhr?

    erb :'comments/_form', layout: false
  else
    if session_is_current_user?(@user)
      erb :'comments/_form'
    else
      @msgs = ["You must be logged in to comment"]
      erb :'/comments/errors', layout: false
    end
  end
end

post '/questions/:question_id/comments' do
  session_require_login!

  @author = session_current_user
  @question = Question.find(params[:question_id])
  @commentable_id = @question.id
  @commentable_type = "questions"
  if session_is_current_user?(@author)
    @comment = @question.comments.new(body: params[:comment_body], author_id: @author.id )
    if @comment.save
      if request.xhr?
        "string"
        erb :'/comments/_comment', layout: false, :locals => {comment: @comment}
      else
        erb :'/comments/show'
      end
    end
  else
    @msgs = ["You must be logged in to comment"]
     erb :'comments/errors'
  end
end

# get '/questions/:question_id/comments/:id'
# redirect '/questions/:question_id'

# ROUTES FOR COMMENTS ON ANSWERS

before '/answers/:id/comments*' do
  @answer = Answer.find(params[:id])
end

get '/answers/:id/comments' do
  @comments = @answer.comments
  erb :'answers/comments/show'
end

get '/answers/:id/comments/new' do
  session_require_login!
  @commentable_id = @answer.id
  @commentable_type = "answers"
  erb :'comments/_form'
end

post '/answers/:id/comments' do
  session_require_login!
  @answer.comments.create!(body: params[:comment_body], author: session_current_user)
  redirect '/answers/:answer_id'
end
