
# ROUTES FOR COMMENTS ON QUESTIONS

get '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  erb :'questions/comments/show'
end

get '/questions/:id/comments/new' do
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
    erb :'/comments/errors', layout: false
  end
end

post '/answers/:answer_id/comments' do
  @author = session_current_user
  if session_is_current_user?(@author)
    @answer = Answer.find(params[:answer_id])
    @author = session_current_user
    @comment = @answer.comments.create(body: params[:comment_body], author_id: @author.id, commentable_id: @answer.id, commentable_type: "answer" )
  end
  if session_is_current_user(@author)
    erb :'comments/show'
  else
    @msgs = "You must be logged in to comment"
    erb :'/comments/errors'
  end
end
