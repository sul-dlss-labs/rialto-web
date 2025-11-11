# frozen_string_literal: true

# render header menu
class HeaderComponent < ApplicationComponent
  def hero_image
    number = rand(0..2)
    asset_url("rialto-web-hero-#{number}.png")
  end
end
