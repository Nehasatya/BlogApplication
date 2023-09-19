require 'rails_helper'

RSpec.describe "Topics", type: :request do

    it 'checking Http status codes' do
      get topics_path
      expect(response).to have_http_status(200)
    end

  context 'Topic new' do
    before(:each) do
      @topic = Topic.new(title: 'Test_topic')
    end
      context 'new success' do
        it 'flash notice on new success' do
          post "/topics" , params: {topic: @topic.attributes}
          expect(flash[:notice]).to eq("Topic was successfully created.")
        end
        it 'redirect to posts path' do
          post "/topics" , params:  {topic: @topic.attributes}
          expect(response).to redirect_to(topics_path)
        end
      end
      # context 'new failed' do
      #   it 'http status on new failed' do
      #     post "topic/new/{}"
      #     expect(response).to have_http_status(:unprocessable_entity)
      #   end
      #   it 'redirect to posts path' do
      #     post "topic/new/{}"
      #     expect(response).to redirect_to(new_topic_path)
      #   end
      # end
    end

  context 'Topic Update' do
      context 'update success' do
        before(:each) do
          @topic = Topic.create(title: 'Test_topic 1')
        end
        it 'flash notice on update success' do
          patch '/topics/1', params: {topic: @topic.attributes}
          expect(flash[:notice]).to eq("Topic was successfully updated.")
        end
        it 'redirect to post path' do
          patch "/topics/#{@topic.id}", params: {topic:@topic.attributes}
          expect(response).to redirect_to(topic_url(@topic))
        end
      end
      # context 'update failed' do
      #   before(:each) do
      #     @topic = Topic.new(title: 'Test_topic 2')
      #   end
      #   it 'http status on update failed' do
      #     patch '/topic/1', params: { topic: ""}
      #     expect(response).to have_http_status(:unprocessable_entity)
      #   end
      #   it 'redirect to edit path' do
      #     patch '/topic/4', params: { topic:@topic.attributes}
      #     expect(response).to redirect_to(edit_topic_path)
      #   end
      # end
    end

  context 'Topic Destroy' do
    it 'return notices on successful destroy' do
      delete "/topics/1"
      expect(flash[:notice]).to eq("Topic was successfully destroyed.")
    end

    it 'redirects to topics path' do
      delete "/topics/2"
      expect(response).to redirect_to(topics_path)
    end
  end
end

