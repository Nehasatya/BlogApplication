require 'rails_helper'

RSpec.describe "Comments", type: :request do

  context 'Testing index' do

    it 'return status 200' do
      get '/topics/1/posts/1/'
      expect(response).to have_http_status(200)
    end
  end

  context 'Create comment successfully' do
    before(:all) do
      @topic = Topic.find(1)
      @post = @topic.post.find(1)
      @comment = @post.comment.new(com_description: "This is a comment description")
    end
    it 'sets flash' do
      post '/topics/1/posts/1/comments/', params: { comment: @comment.attributes}
      expect(flash[:notice]).to eql("Comment created successfully")
    end

    it 'redirects' do
      post '/topics/1/posts/1/comments/', params: {comment: @comment.attributes}
      expect(response).to redirect_to(topic_posts_path)
    end
  end

  context 'Update comment successfully' do
    before(:each) do
      @topic = Topic.find(1)
      @post = @topic.post.find(1)
      @comment = @post.comment.new(com_description:"tommorrow tonight")
    end
    it 'sets flash' do
      patch "/comments/#{@comment.id}" , params: {comment: @comment.attributes,topic_id: @topic.id, post_id:@post.id,id:@comment.id}
      expect(flash[:notice]).to eql("Comment updated successfully")
    end

    it 'redirects' do
      patch "/comments/#{@comment.id}" , params: {comment: @comment.attributes,topic_id: @topic.id, post_id:@post.id,id:@comment.id}
      expect(response).to redirect_to(topic_posts_path(@topic))
    end
  end

  context 'Destroy comment successfully' do
    before(:each) do
      @topic = Topic.find(1)
      @post = @topic.post.find(1)
      @comment = @post.comment.new(com_description:"tommorrow tonight")
    end
    it 'sets flash' do
      delete "/comments/#{@comment.id}", params: {comment: @comment.attributes,topic_id:@topic.id,post_id:@post.id,id:@comment.id}
      expect(flash[:notice]).to eql("Comment deleted")
    end
    end
end
