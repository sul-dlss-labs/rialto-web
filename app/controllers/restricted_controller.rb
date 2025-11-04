# frozen_string_literal: true

# Controller for the workgroup restricted access pages, subclass as needed
class RestrictedController < ApplicationController
  before_action :check_authorization

  def self.policy_name
    'RestrictedPolicy'
  end

  private

  def check_authorization
    authorize! to: :view?
  end
end
