class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :get_topic
  before_action :get_post
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = @post.comments.new
  end

  def show
    redirect_to topic_post_path(@post)
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to request.referrer, notice: "Comment created successfully"}
      else
        format.html{ redirect_to request.referrer, notice: "Comment creation failed"}
      end
    end
  end

  def edit
  end

  def update
    # if params.has_key?(:user_comment_ratings)
    #   create_rating
    # end
    @com_rating = @comment.user_comment_ratings.build
    @com_rating.save
    respond_to do |format|
      if @comment.update(comment_params)
        format.html{ redirect_to request.referrer, notice: "Comment updated successfully"}
      else
        format.html{ redirect_to request.referrer, notice: "Comment not updated"}
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do|format|
      format.html{ redirect_to topic_posts_path(@topic), notice: "Comment deleted"}
    end
  end

  def create_rating
    @comment = Comment.find(params[:user_comment_rating][:comment_id])
    @ratings = @comment.user_comment_ratings.build(rating_params)
    respond_to do |format|
      if @ratings.save
        format.js
      else
        format.js
      end
    end
  end

  def show_ratings
    @comment_ratings = @comment.user_comment_ratings
  end

  private

  def get_topic
    if params.has_key?(:topic_id)
    @topic = Topic.find(params[:topic_id])
    end
  end

  def get_post
    if params.has_key?(:post_id)
    @post = @topic.posts.find(params[:post_id])
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def create_or_edit
    if params[:commit] == 'Create'
      create
    else
      update
    end
  end

  def comment_params
    params.require(:comment).permit(:com_description,:topic_id,:post_id,:id,:author_name, :user_comment_ratings_attributes => [:rating_value,:comment_id,:user_id])
  end

  def rating_params
    params.require(:user_comment_rating).permit(:rating_value,:comment_id,:user_id)
  end
end
