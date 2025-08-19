class StanfordPolicy < ApplicationPolicy
  def view?
    !Current.groups.blank?
  end
end
