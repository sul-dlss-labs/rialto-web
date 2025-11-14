# frozen_string_literal: true

# Show the tabs above the dashboard embed
class DashboardTabComponent < ApplicationComponent
  attr_reader :tab_classes, :dashboard_type

  delegate :authenticated?, :allowed_to?, to: :helpers

  def initialize(dashboard_type:)
    super()
    @dashboard_type = dashboard_type
  end

  def tabs
    Settings.tabs[dashboard_type].to_h.deep_transform_keys(&:to_s)
  end

  def selected_tab
    params[:tab] || tabs.keys.first
  end

  def src_url(tab)
    public_send("#{dashboard_type}_#{tab.tr('-', '_')}_path")
  end
end
