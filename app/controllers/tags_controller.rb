class TagsController < ApplicationController
  before_action :set_topic, except: :index
  before_action :set_post, only: %i[show edit destroy update]
  before_action :set_tag, only: %i[show edit destroy update]


  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.create(tag_params)
    respond_to do |format|
      if @tag.save!
        format.html{ redirect_to topic_post_path(@post) ,notice: "Tag created successfully"}
      else
        format.html{ redirect_to topic_post_path(@post) , notice: "Tag not created"}
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tags_params)
        format.html{ redirect_to topic_post_path(@post) ,notice: "Tag created successfully"}
      else
        format.html{ redirect_to topic_post_path(@post) , notice: "Tag not created"}
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to topic_post_path(@post), notice: "tag was successfully destroyed." }
    end
  end


  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_post
    @post = @topic.posts.find(params[:post_id])
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
