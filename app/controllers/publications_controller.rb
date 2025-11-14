# frozen_string_literal: true

# PublicationsController
class PublicationsController < ApplicationController
  skip_verify_authorized
  def index; end

  def download
    authorize! to: :view?, with: RestrictedPolicy

    file = DownloadFile.new(set: params[:set])
    send_file file.filepath,
              filename: file.zip_filename,
              type: 'application/zip',
              disposition: 'attachment'
  end
end
