enable :sessions

get '/login' do
  erb :'users/login'
end

post '/login' do
  input = params[:user]
  @user = User.authenticate(input[:email], input[:password]);
  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    @login_error = "User not recognized"
    erb :"users/login"
  end
end

get '/logout' do
  session.destroy
  redirect "/questions"
end

get '/access-denied' do
  'Access Denied. Please log in.<a href="/login">Log in</a>'
end
