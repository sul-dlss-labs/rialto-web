# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show public page' do
  let(:name) { 'Awesome Dude' }

  context 'when user is logged in' do
    let(:user) { create(:user, name:) }

    before do
      sign_in(user)
    end

    it 'shows the public page with logged in message' do
      get '/public/index'

      expect(response.body).to include('Public')
      expect(response.body).to include("Logged in: #{name}")
    end
  end

  context 'when user is not logged in' do
    it 'shows the public page' do
      get '/public/index'

      expect(response.body).to include('Public')
      expect(response.body).not_to include("Logged in: #{name}")
    end
  end
end
