get '/questions' do
  redirect '/'
end

get '/' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  redirect '/login' unless session_current_user
  if request.xhr?
    erb :'questions/_new', layout: false
    'not working'
  else
    erb :'questions/new'
  end
end

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
    erb :'questions/new'
  end
end
