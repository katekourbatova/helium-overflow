# All questions - redirects to homepage
get '/questions' do
  redirect '/'
end

#homepage
get '/' do
  @questions = Question.all
  erb :'questions/index'
end

# a specific question
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

# form for making new question
get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  # ...
end

# Show New Question Form
