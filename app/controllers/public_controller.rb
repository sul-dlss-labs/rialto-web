# frozen_string_literal: true

# Controller for the public access pages, subclass as needed
class PublicController < ApplicationController
  skip_verify_authorized
  before_action :require_turbo_frame, except: [:show]

  def show; end

  private

  def stanford_access?
    current_user && allowed_to?(:view?, with: StanfordPolicy)
  end

  def business_access?
    current_user && allowed_to?(:view?, with: RestrictedPolicy)
  end

  def turbo_frame_id
    "#{action_name.tr('_', '-')}-frame"
  end

  def embed_url
    "#{Settings.tableau.base_url}#{Settings.tableau.dashboard_base_path}#{dashboard_name}/#{action_name.camelize}"
  end

  def dashboard_name
    controller_name.camelize
  end

  def token
    return unless current_user

    mint_jwt_token
  end
end
