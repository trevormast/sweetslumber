module ApplicationHelper
  def admin_present?
    current_user.try(:admin?)
  end

  def registered_user?
    current_user.present? && current_user.registrations.present?
  end
end
