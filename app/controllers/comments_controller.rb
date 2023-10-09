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
    params.require(:comment).permit(:com_description,:topic_id,:post_id,:id,:author_name)
  end
end
