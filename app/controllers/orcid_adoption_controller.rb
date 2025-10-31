# frozen_string_literal: true

# Controller for the orcid dashboards
class OrcidAdoptionController < ApplicationController
  before_action :mint_jwt_token, except: %i[show stanford_overview]
  before_action :require_turbo_frame, except: [:show]

  allow_unauthenticated_access only: %i[show stanford_overview]
  skip_verify_authorized only: %i[show stanford_overview]

  # main dashboard page, accessible to all users; use tab param to select which tab is active
  def show
    @tab = params[:tab] || 'overview'
  end

  # the stanford overview dashboard embedded view (all users) -
  # turbo frame loaded only when tab is selected
  def stanford_overview
    render DashboardEmbedComponent.new(embed_url: Settings.dashboard.orcid_adoption.stanford_overview,
                                       turbo_frame_id: 'overview_tab')
  end

  # the schools and departments dashboard embedded view (stanford users only) -
  # turbo frame loaded only when tab is selected
  def schools_and_departments
    authorize! to: :view?, with: StanfordPolicy

    render DashboardEmbedComponent.new(embed_url: Settings.dashboard.orcid_adoption.schools_and_departments,
                                       turbo_frame_id: 'schools_tab')
  end

  # the individual researchers dashboard embedded view (workgroup users only) -
  # turbo frame loaded only when tab is selected
  def individual_researchers
    authorize! to: :view?, with: RestrictedPolicy

    render DashboardEmbedComponent.new(embed_url: Settings.dashboard.orcid_adoption.individual_researchers,
                                       turbo_frame_id: 'researchers_tab')
  end
end
