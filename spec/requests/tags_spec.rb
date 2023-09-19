require 'rails_helper'

RSpec.describe "Tags", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/tags/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/tags/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/tags/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/tags/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /feature" do
    it "returns http success" do
      get "/tags/feature"
      expect(response).to have_http_status(:success)
    end
  end

end
