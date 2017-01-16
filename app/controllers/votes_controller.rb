post '/:voteable_type/:id/upvote' do
  redirect '/login' unless session_current_user
  user = User.find(session[:user_id])
  voteable_class = Module.const_get(params[:voteable_type].chop.capitalize)
  what_to_upvote = voteable_class.find(params[:id])
  what_to_upvote.upvote(user)
  redirect "/questions/#{what_to_upvote.parent_question_id}"
end

post '/:voteable_type/:id/downvote' do
  redirect '/login' unless session_current_user
  user = User.find(session[:user_id])
  voteable_class = Module.const_get(params[:voteable_type].chop.capitalize)
  what_to_downvote = voteable_class.find(params[:id])
  what_to_downvote.downvote(user)
  redirect "/questions/#{what_to_downvote.parent_question_id}"
end
