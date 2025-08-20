# frozen_string_literal: true

# Controller for the public access pages
class PublicController < ApplicationController
  allow_unauthenticated_access
  skip_verify_authorized

  def index; end
end
