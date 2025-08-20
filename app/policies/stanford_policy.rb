# frozen_string_literal: true

# Policy for Stanford-only access requiring user authentication
class StanfordPolicy < ApplicationPolicy
  def view?
    Current.user.present?
  end
end
