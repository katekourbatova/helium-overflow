get '/questions/:id/answers/new' do
  redirect '/login' unless session_current_user
  @question = Question.find(params[:id])
  if request.xhr?
    erb :'answers/_new', layout: false
  else
    erb :'answers/new'
  end
end

post '/questions/:id/answers/' do
  redirect '/login' unless session_current_user
  @question = Question.find(params[:id])
  @answer = Answer.new(params[:answer])
  @answer.question_id = @question.id
  @answer.author_id = session_current_user.id
  if @answer.save
    if request.xhr?
      erb :'answers/_answer', layout: false, locals: { :answer => @answer }
    else
      redirect "/questions/#{@question.id}"
    end
  else
    status 422
    @errors = @answer.errors.full_messages
    if request.xhr?
      erb :'_error', layout: false
    else
      erb :'answers/new'
    end
  end
end
