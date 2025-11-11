# frozen_string_literal: true

# Download File
class DownloadFile
  require 'zip'

  def initialize(set:)
    @set = set
  end

  attr_reader :set

  def filename
    return 'publications.csv' if set == 'all'

    "publications_by_#{set}.csv"
  end

  def filepath
    File.join(Settings.downloads.path, zip_filename)
  end

  def zip_filename
    "#{filename}.zip"
  end

  def size
    zip = Zip::File.open(filepath)
    entry = zip.find_entry(filename)
    (entry.size.to_f / (1024**3)).round(2)
  end

  def last_updated
    File.mtime(filepath).strftime('%B %-d, %Y')
  end
end
