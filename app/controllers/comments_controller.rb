class CommentsController < ApplicationController
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
    @comment = @post.comments.new(comments_params)

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to topic_posts_path, notice: "Comment created successfully"}
      else
        format.html{ redirect_to topic_posts_path, notice: "Comment creation failed"}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comments_params)
        format.html{ redirect_to topic_posts_path, notice: "Comment updated successfully"}
      else
        format.html{ redirect_to topic_posts_path, notice: "Comment not updated"}
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
    @topic = Topic.find(params[:topic_id])
  end

  def get_post
    @post = @topic.posts.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:com_description,:topic_id,:post_id,:id)
  end
end
