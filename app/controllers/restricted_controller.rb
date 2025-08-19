# frozen_string_literal: true

# Controller for the workgroup restricted access pages
class RestrictedController < ApplicationController
  before_action :check_authorization

  def index
  end

  private

  def check_authorization
    authorize! to: :view?
  end

  def self.policy_name
    'RestrictedPolicy'
  end

  def implicit_authorization_target
    self
  end
end
