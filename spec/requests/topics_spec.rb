require 'rails_helper'

RSpec.describe "Topics", type: :request do

  context 'checking Http status codes' do

    it 'returns a status 200' do
      get '/topics'
      expect(response).to have_http_status(200)
    end

  end




end