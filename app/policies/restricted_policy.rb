# frozen_string_literal: true

# Policy for restricted access requiring specific group membership
class RestrictedPolicy < ApplicationPolicy
  def view?
    Current.user.present? && Current.groups.include?(Settings.authorization_workgroup_names.rialto)
  end
end
