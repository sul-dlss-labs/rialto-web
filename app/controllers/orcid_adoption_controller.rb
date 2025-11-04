# frozen_string_literal: true

# Controller for the orcid dashboards
class OrcidAdoptionController < ApplicationController
  before_action :require_turbo_frame, except: [:show]

  skip_verify_authorized

  # main dashboard page, accessible to all users
  # use tab param to select which tab is active (default is overview)
  def show
    @tab = params[:tab] || 'overview'
  end

  # the stanford overview dashboard embedded view (all users) -
  # turbo frame loaded only when tab is selected
  def stanford_overview
    render DashboardEmbedComponent.new(embed_url: Settings.dashboard.orcid_adoption.stanford_overview,
                                       turbo_frame_id: 'overview_tab', authorized: true)
  end

  # the schools and departments dashboard embedded view (stanford users only) -
  # turbo frame loaded only when tab is selected
  def schools_and_departments
    render DashboardEmbedComponent.new(embed_url: Settings.dashboard.orcid_adoption.schools_and_departments,
                                       turbo_frame_id: 'schools_tab', token:,
                                       authorized: current_user && allowed_to?(:view?, with: StanfordPolicy))
  end

  # the individual researchers dashboard embedded view (workgroup users only) -
  # turbo frame loaded only when tab is selected
  def individual_researchers
    render DashboardEmbedComponent.new(embed_url: Settings.dashboard.orcid_adoption.individual_researchers,
                                       turbo_frame_id: 'researchers_tab', token:,
                                       authorized: current_user && allowed_to?(:view?, with: RestrictedPolicy))
  end

  private

  def token
    mint_jwt_token if current_user
  end
end
