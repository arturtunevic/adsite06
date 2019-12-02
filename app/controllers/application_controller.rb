class ApplicationController < ActionController::Base

  def guest_user
    if session[:guest_user_id] != nil
      true
    else
      false
    end
  end

  def create_guest_user
    u = User.new(email: "guest_#{Time.now.to_i}#{rand(100)}@example.com")
    u.save!(validate: false)
    session[:guest_user_id] = u.id
    redirect_to '/'
  end

  def delete_guest_session
    u = User.find(session[:guest_user_id])
    User.delete(u.id)
    session[:guest_user_id] = nil
    redirect_to root_path
  end

end
