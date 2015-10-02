module ApplicationHelper
  def current_user
    User.find(@user_id)
  end
end
