# frozen_string_literal: true

# Controller for the stanford only access pages
class StanfordController < ApplicationController
  before_action :check_authorization


  def index
  end

  private

  def check_authorization
    authorize! to: :view?
  end

  def self.policy_name
    'StanfordPolicy'
  end

  def implicit_authorization_target
    self
  end
end
