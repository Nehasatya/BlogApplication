class PostsController < ApplicationController
  before_action :get_topic
  before_action :set_post, only: %i[show edit destroy update]

  def index
    @posts = @topic.post
  end

  def show
  end

  def new
    @post = @topic.post.new
  end

  def edit
  end

  def create
    @post = @topic.post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to topic_posts_path(@topic), notice: "Post created successfully" }
      else
        format.html { render :new, notice: "Post creation failed...Create a new post" }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to topic_posts_path, notice: "Posts deleted" }
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topic_posts_path(@topic), notice: "Post updated" }
      else
        format.html { render :edit, notice: "Post update failed" }
      end
    end
  end

  private

  def get_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_post
    @post = @topic.post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :author_name, :topic_id)
  end
end
