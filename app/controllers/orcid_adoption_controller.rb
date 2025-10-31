# frozen_string_literal: true

# Controller for the orcid dashboards
class OrcidAdoptionController < ApplicationController
  before_action :mint_jwt_token, only: [:schools_and_departments, :individual_researchers]

  allow_unauthenticated_access only: %i[show stanford_overview]
  skip_verify_authorized only: %i[show stanford_overview]

  # main dashboard page, accessible to all users
  def show; end

  # the stanford overview dashboard embedded view (all users)
  def stanford_overview
    render DashboardEmbedComponent.new(embed_url: Settings.dashboard.orcid_adoption.stanford_overview,
                                       turbo_frame_id: 'overview_tab')
  end

  # TODO: secure the below two actions with appropriate policies
  # the schools and departments dashboard embedded view (stanford users only)
  def schools_and_departments
    authorize! to: :view?, with: StanfordPolicy

    render DashboardEmbedComponent.new(embed_url: Settings.dashboard.orcid_adoption.schools_and_departments,
                                       turbo_frame_id: 'schools_tab')
  end

  # the individual researchers dashboard embedded view (workgroup users only)
  def individual_researchers
    authorize! to: :view?, with: RestrictedPolicy

    render DashboardEmbedComponent.new(embed_url: Settings.dashboard.orcid_adoption.individual_researchers,
                                       turbo_frame_id: 'researchers_tab')
  end
end
