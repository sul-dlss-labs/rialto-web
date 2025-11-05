# frozen_string_literal: true

# show the embedded tableau dashboard
class DashboardEmbedComponent < ApplicationComponent
  attr_reader :embed_url, :turbo_frame_id, :token

  def initialize(embed_url:, authorized:, turbo_frame_id:, token: nil)
    super()
    @embed_url = embed_url
    @token = token
    @authorized = authorized
    @turbo_frame_id = turbo_frame_id
  end

  def width
    '100%'
  end

  def height
    '1200'
  end

  def authorized?
    @authorized
  end
end
