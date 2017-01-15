get '/questions/:id/answers/new' do
  redirect '/login' unless session_current_user
  @question = Question.find(params[:id])
  erb :'answers/new'
end

post '/questions/:id/answers/' do
  redirect '/login' unless session_current_user
  @question = Question.find(params[:id])
  @answer = Answer.new(params[:answer])
  @answer.question_id = @question.id
  @answer.author_id = session_current_user.id
  @answer.save
  redirect "/questions/#{@question.id}"
end
