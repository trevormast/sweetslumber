module ApplicationHelper
  def admin_present?
    current_user.try(:admin?)
  end
end
