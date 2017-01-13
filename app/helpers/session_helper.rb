helpers do

  def session_current_user
    if session[:user_id].nil?
      @_current_user = nil
    else
      @_current_user ||= User.find(session[:user_id])
    end
  end

  def session_set_user(user)
    @_current_user = user
    session[:user_id] = @_current_user.id
  end

  def session_login_and_redirect(user)
    session_set_user user
    session_on_login_redirect
  end

  def session_logout
    session.destroy
  end

  def session_on_login_redirect
    redirect "/users/#{session_current_user.id}"
  end

  def session_logged_in?
    !session_current_user.nil?
  end

  def session_is_current_user? user
    return false unless session_logged_in?
    user.id == session_current_user.id
  end

end
