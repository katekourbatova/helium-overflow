enable :sessions

get '/users/new' do
  erb :'users/new'
end

get '/users' do
  @user_id = session[:user_id]
  if session[:user_id]
    redirect "users/#{@user_id}"
  else
    erb :'users/login'
  end
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb:'users/new'
  end
end

get '/users/:id' do
  redirect '/access-denied' unless session[:user_id]
  @user = User.find(params[:id])
  erb :'users/profile'
end

get '/access-denied' do
  'Access Denied. Please log in.<a href="/login">Log in</a>'
end
