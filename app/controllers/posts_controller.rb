class PostsController < ApplicationController
  before_action :get_topic, except: :index
  before_action :set_post, only: %i[show edit destroy update]

  def index
    if params.has_key?(:topic_id)
      get_topic
      @posts = @topic.posts
    else
      @posts = Post.all
      render :index
    end
  end

  def show
    @comment = @post.comments
  end

  def new
    @post = @topic.posts.new
  end

  def edit
  end

  def create
    @post = @topic.posts.new(post_params.except(:tags))

    create_or_delete_posts_tags(@post, params[:post][:tags])
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
    create_or_delete_posts_tags(@post, params[:post][:tags])
    respond_to do |format|
      if @post.update(post_params.except(:tags))
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
    @post = @topic.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :author_name, :topic_id,:tags)
  end

  def create_or_delete_posts_tags(post,tags)
      post.taggables.destroy_all
      tags = tags.strip.split(',')
      tags.each do |tag|
        post.tags << Tag.find_or_create_by(name: tag)
      end
  end

end
