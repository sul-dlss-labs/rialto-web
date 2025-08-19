class StanfordPolicy < ApplicationPolicy

  def index
    true
  end

  def view?
    !Current.groups.blank?
  end
end
