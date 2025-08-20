# frozen_string_literal: true

# User model representing application users
class User < ApplicationRecord
  def sunetid
    email_address.delete_suffix(Settings.email_suffix)
  end
end
