# frozen_string_literal: true

# Controller for the public access pages, subclass as needed
class PublicController < ApplicationController
  allow_unauthenticated_access
  skip_verify_authorized

  # TODO: Remove this method and view once example routes are removed.
  def index; end
end
