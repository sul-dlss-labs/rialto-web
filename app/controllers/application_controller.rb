# frozen_string_literal: true

# Base controller from which all other controllers inherit
class ApplicationController < ActionController::Base
  # By default, requires authentication for all controllers.
  # To allow unauthenticated access, use the allow_unauthenticated_access method.
  # Also provides the current_user method.
  include Authentication

  # Adds an after_action callback to verify that `authorize!` has been called.
  # See https://actionpolicy.evilmartians.io/#/rails?id=verify_authorized-hooks for how to skip.
  verify_authorized

  rescue_from ActionPolicy::Unauthorized, with: :deny_access

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def deny_access
    flash[:warning] = 'You are not authorized to view this page.'

    if turbo_frame_request?
      # For Turbo Frame requests, use turbo_stream to redirect the full page
      render turbo_stream: turbo_stream.action(:redirect, root_url), status: :see_other
    else
      # For regular requests, redirect normally
      redirect_to root_path
    end
  end

  def mint_jwt_token
    @token = JwtService.encode
  end

  def implicit_authorization_target
    self
  end
end
