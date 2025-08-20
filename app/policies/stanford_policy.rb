class StanfordPolicy < ApplicationPolicy
  def view?
    Current.user.present?
  end
end
