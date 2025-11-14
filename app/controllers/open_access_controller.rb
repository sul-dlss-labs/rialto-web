# frozen_string_literal: true

# Controller for the open access dashboards
class OpenAccessController < PublicController
  # the stanford overview dashboard embedded view (all users) -
  # turbo frame loaded only when tab is selected
  def stanford_overview
    render DashboardEmbedComponent.new(embed_url:,
                                       turbo_frame_id:, authorized: true)
  end

  # the schools and departments dashboard embedded view (stanford users only) -
  # turbo frame loaded only when tab is selected
  def school_overview
    render DashboardEmbedComponent.new(embed_url:,
                                       turbo_frame_id:, token:,
                                       authorized: stanford_access?)
  end

  def school_details
    render DashboardEmbedComponent.new(embed_url:,
                                       turbo_frame_id:, authorized: stanford_access?)
  end

  # the schools and departments dashboard embedded view (stanford users only) -
  # turbo frame loaded only when tab is selected
  def department_details
    render DashboardEmbedComponent.new(embed_url:,
                                       turbo_frame_id:, token:,
                                       authorized: stanford_access?)
  end
end
