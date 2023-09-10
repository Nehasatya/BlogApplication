require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before(:each) do
    @articles = ArticlesController.new
  end

  describe "#hello" do
    expect(@articles).to eql("hello")
  end
end
