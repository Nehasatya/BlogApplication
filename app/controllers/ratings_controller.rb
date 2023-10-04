class RatingsController < ApplicationController
  before_action :set_post
  before_action :set_rating, only: %i[edit update destroy show]

  def index
    @ratings = @post.ratings
  end

  def new
    @rating = @post.ratings.new
  end

  def create
    @rating = @post.ratings.create(rating_params)

    respond_to do |format|
      if @rating.save!
        format.html{ redirect_to  request.referrer, notice: "Rating successful"}
      else
        format.html{ redirect_to @post , notice: "Rating not successful"}
      end
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_rating
    @rating = @post.ratings.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def rating_params
    params.require(:rating).permit!
  end
end