get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answers/new'
end

