module ApplicationHelper
  def me? user
    current_user.id == user.id
  end

  def breadcrumbs items
    render partial: "components/breadcrumbs", locals: {items: items}
  end
end
