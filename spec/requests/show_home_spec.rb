# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show home page' do
  context 'when user is logged in' do
    before do
      sign_in(create(:user))
    end

    it 'shows the home page with logged in message' do
      get '/'

      expect(response.body).to include('RIALTO Web App Home Page')
      expect(response.body).to include('Logged in: User')
    end
  end

  context 'when user is not logged in' do
    it 'shows the home page' do
      get '/'

      expect(response.body).to include('RIALTO Web App Home Page')
      expect(response.body).not_to include('Logged in: User')
    end
  end
end
