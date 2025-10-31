# frozen_string_literal: true

# Show the header above a dashboard embed
class DashboardHeaderComponent < ApplicationComponent
  attr_reader :title

  def initialize(title:)
    super()
    @title = title
  end
end
