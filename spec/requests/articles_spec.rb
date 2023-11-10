require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before(:each) do
    @articles = ArticlesController.new
  end

  describe '#index' do
    it 'return hello' do
      expect(@articles.index).to eql("hello")
    end
  end
end
