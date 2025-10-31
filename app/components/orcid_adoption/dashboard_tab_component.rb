# frozen_string_literal: true

module OrcidAdoption
  # Show the tabs above the orcid adoption dashboard embed
  class DashboardTabComponent < ApplicationComponent
    attr_reader :active_tab

    def initialize(active_tab: 'overview')
      super()
      @active_tab = active_tab
    end
  end
end
