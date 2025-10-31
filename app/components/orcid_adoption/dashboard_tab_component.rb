# frozen_string_literal: true

module OrcidAdoption
  # Show the tabs above the orcid adoption dashboard embed
  class DashboardTabComponent < ApplicationComponent
    attr_reader :tab_classes, :tab

    delegate :authenticated?, :allowed_to?, to: :helpers

    def initialize(tab: 'overview')
      super()
      @tab = tab
      @tab_classes = Hash.new('')
      @available_tabs = %w[overview schools researchers download]
    end

    def before_render
      @available_tabs.each { |t| @tab_classes[t] = 'active' if t == tab }
      @tab_classes['schools'] += ' disabled' unless authenticated? && allowed_to?(:view?, :stanford)
      @tab_classes['researchers'] += ' disabled' unless authenticated? && allowed_to?(:view?,
                                                                                      :restricted)
      @tab_classes['download'] += ' disabled' unless authenticated? && allowed_to?(:view?, :restricted)
    end
  end
end
