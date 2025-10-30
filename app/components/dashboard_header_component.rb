# frozen_string_literal: true

class DashboardHeaderComponent < ViewComponent::Base
    attr_reader :title

    def initialize(title:)
      @title = title
    end
end
