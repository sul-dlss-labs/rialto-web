# frozen_string_literal: true

# Controller for the home page
class HomeController < ApplicationController
  allow_unauthenticated_access
  skip_verify_authorized

  def show; end
end
