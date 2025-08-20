# frozen_string_literal: true

# Controller for the stanford only access pages
class StanfordController < ApplicationController
  before_action :check_authorization

  def index; end

  def self.policy_name
    'StanfordPolicy'
  end

  private

  def check_authorization
    authorize! to: :view?
  end
end
