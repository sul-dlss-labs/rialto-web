# frozen_string_literal: true

# Base model from which all other models inherit
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
