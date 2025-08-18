# frozen_string_literal: true

# Controller for the home page
class HomeController < ApplicationController
  allow_unauthenticated_access only: :show
  skip_verify_authorized only: :show

  def show
  end
end
