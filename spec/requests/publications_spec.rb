# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Publications' do
  describe 'GET /index' do
    context 'when user is not logged in' do
      it 'returns login alert' do
        get '/download'
        expect(response).to have_http_status(:success)
        expect(response.body).to include 'This page is only available to Stanford-affiliated users.'
      end
    end

    context 'when user is logged in without correct permissions' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
      end

      it 'returns page info' do
        get '/download'
        expect(response).to have_http_status(:success)
        expect(response.body).to include 'This page is only available to select users.'
      end
    end

    context 'when user is logged in with correct permissions' do
      let(:user) { create(:user) }
      let(:workgroup_name) { Settings.authorization_workgroup_names.rialto }

      before do
        sign_in(user, groups: [workgroup_name])
      end

      it 'returns page info' do
        get '/download'
        expect(response).to have_http_status(:success)
        expect(response.body).to include 'publications_by_department.csv'
      end
    end
  end
end
