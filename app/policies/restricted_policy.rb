class RestrictedPolicy < ApplicationPolicy
  def view?
    Current.user.present? && Current.groups.include?(Settings.authorization_workgroup_names.rialto)
  end
end
