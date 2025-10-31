# frozen_string_literal: true

# render flash messages
class FlashComponent < ApplicationComponent
  attr_reader :flash

  def initialize(flash:)
    super()
    @flash = flash
  end
end
