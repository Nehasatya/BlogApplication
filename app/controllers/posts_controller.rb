class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :get_topic
  before_action :set_user
  before_action :attach_image, only: :show
  # before_action :set_post, only: %i[show edit destroy update]

  def index
    if @topic.nil?
      @posts = Post.eager_load(:topic).paginate(page: params[:page],per_page:5)
    else
      @posts = @topic.posts
    end
  end

  def show
    @comments = @post.comments.includes(:user)
    @ratings = @post.ratings
  end

  def new
    @post = @topic.posts.new
  end

  def edit
  end

  def create
    @post = @topic.posts.new(post_params.except(:tags))
    @post.user_id = current_user.id
    create_or_delete_posts_tags(@post, params[:post][:tags])
    respond_to do |format|
      if @post.save
        format.html { redirect_to topic_posts_path(@topic)}
        format.js
        format.json {render @topic}
      else
        format.js { render :save_failed, notice: "Post creation failed!" }
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
        format.html { redirect_to [@topic, @post], notice: "Post updated" }
      else
        format.html { render :edit, notice: "Post update failed" }
      end
    end
  end

  def change_read_status
    if @user.posts << @post
      render json: { status: :success}
    else
      render json: { status: :error}
    end
    # fail
  end

  private

  def get_topic
    if params.has_key?(:topic_id)
      @topic = Topic.find(params[:topic_id])
    end
  end

  def attach_image
    if params.has_key?(:image)
      @post.image.attach(params[:image])
    end
  end

  def set_user
    if params.has_key?(:user_id)
      @user = User.find(params[:user_id])
    end
  end

  # def set_post
  #   @post = @topic.posts.find(params[:id])
  # end

  def post_params
    params.require(:post).permit(:title, :description, :author_name, :topic_id,:tags,:image,:user_id, :rating => [:stars])
  end

  def create_or_delete_posts_tags(post,tags)
      post.taggables.destroy_all
      if tags.present?
      tags = tags.strip.split(',')
      tags.each do |tag|
        post.tags << Tag.find_or_create_by(name: tag)
      end
      end
  end

end
