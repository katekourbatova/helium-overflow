enable :sessions

get '/users/new' do
  erb :'users/new'
end

get '/users' do
  current_user = session_current_user
  if session_is_current_user?(current_user)
    redirect "/users/#{@user_id}"
  else
    erb :'users/login'
  end
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session_is_current_user(@user)
    redirect "/users/#{@user.id}"
  else
    erb:'users/new'
  end
end

get '/users/:id' do
  redirect '/access-denied' unless session_logged_in?
  session_current_user
  erb :'users/profile'
end

get '/access-denied' do
  'Access Denied. Please log in.<a href="/login">Log in</a>'
end
