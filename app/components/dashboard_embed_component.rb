# frozen_string_literal: true

# show the embedded tableau dashboard
class DashboardEmbedComponent < ApplicationComponent
  attr_reader :embed_url, :turbo_frame_id, :width, :height, :token

  def initialize(embed_url:, turbo_frame_id:, width: '100%', height: '1200', token: nil)
    super()
    @embed_url = embed_url
    @turbo_frame_id = turbo_frame_id
    @width = width
    @height = height
    @token = token
  end
end
