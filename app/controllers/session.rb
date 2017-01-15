enable :sessions

get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.authenticate(params[:user]);
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
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
