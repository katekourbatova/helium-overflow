enable :sessions

get '/login' do
  erb :'users/login'
end

post '/login' do
  input = params[:user]
  @user = User.authenticate(input[:email], input[:password]);
  if @user
    session_set_user @user
    redirect "/"
  else
    @login_error = "User not recognized"
    erb :"users/login"
  end
end

get '/logout' do
  session_logout
  redirect "/questions"
end

get '/access-denied' do
  'Access Denied. Please log in.<a href="/login">Log in</a>'
end
