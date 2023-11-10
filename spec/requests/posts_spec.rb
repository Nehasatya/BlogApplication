require 'rails_helper'

RSpec.describe "Posts", type: :request do

  context "Testing index" do
    it 'return 200 status code' do
      get '/topics/1/posts'
      expect(response).to have_http_status(200)
    end
  end

  context "Testing new" do

    context 'Create Successfully' do
      before(:all) do
        @topic = Topic.find(1)
        @post = @topic.post.new
      end

      it 'set flash successfully' do
        post '/topics/1/posts/', params: {post:@post.attributes}
        expect(flash[:notice]).to eq("Post created successfully")
      end

      it 'redirects to posts path' do
        post '/topics/1/posts/', params: {post:@post.attributes}
        expect(response).to redirect_to(topic_posts_path)
      end
    end

    # context 'Create Unsuccessfull' do
    #   before(:all) do
    #     @topic = Topic.find(1)
    #     @post = @topic.post.new
    #   end
    #
    #   it 'set flash upon failure' do
    #     post '/topics/posts/', params: {post:@post.attributes}
    #     expect(flash[:notice]).to eq("Post created successfully")
    #   end
    #
    #   it 'redirects to posts path' do
    #     post '/topics/posts/', params: {post:@post.attributes}
    #     expect(response).to redirect_to(topic_posts_path)
    #   end
    # end

    context 'Update Successfully' do
      before(:all) do
        @topic = Topic.find(1)
        @post = @topic.post.new(title:"Test post title", description:"This is description", topic_id:@topic.id)
      end

      it 'set flash successfully' do
        patch "/topics/1/posts/#{@post.id}", params: {post:@post.attributes}
        expect(flash[:notice]).to eq("Post updated")
      end

      it 'redirects to posts path' do
        patch "/topics/1/posts/#{@post.id}", params: {post:@post.attributes}
        expect(response).to redirect_to(topic_posts_path)
      end
    end

    context 'Destroyed Successfully' do

      it 'set flash successfully' do
        delete '/topics/1/posts/1'
        expect(flash[:notice]).to eq("Posts deleted")
      end
      end

  end

end
