module ApplicationHelper
  def me? user
    current_user.id == user.id
  end
end
