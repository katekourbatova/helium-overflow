# All questions - redirects to homepage
get '/questions' do
  redirect '/'
end

#homepage
get '/' do
  @questions = Question.all
  erb :'questions/index'
end

# form for making new question
get '/questions/new' do
  erb :'questions/new'
end

# a specific question
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

post '/questions' do
  redirect '/login' unless session_current_user
  @question = Question.new(params[:question])
  @question.author_id = session_current_user.id

  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'entries/new'
  end
end

# Show New Question Form
