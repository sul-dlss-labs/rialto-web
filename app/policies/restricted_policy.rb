class RestrictedPolicy < ApplicationPolicy
  def view?
    Current.groups.include?(Settings.authorization_workgroup_names.rialto)
  end
end
