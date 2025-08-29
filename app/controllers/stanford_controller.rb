# frozen_string_literal: true

# Controller for the stanford only access pages
class StanfordController < ApplicationController
  before_action :check_authorization
  before_action :mint_jwt_token, only: [:index]

  def index; end

  def self.policy_name
    'StanfordPolicy'
  end

  private

  def check_authorization
    authorize! to: :view?
  end
end
