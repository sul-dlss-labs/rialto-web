# frozen_string_literal: true

# show the embedded tableau dashboard
class DashboardEmbedComponent < ApplicationComponent
  attr_reader :embed_url, :turbo_frame_id

  def initialize(embed_url:, turbo_frame_id:)
    super()
    @embed_url = embed_url
    @turbo_frame_id = turbo_frame_id
  end
end
