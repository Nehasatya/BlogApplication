module ApplicationHelper
  def stars_count(post)
    post.ratings.all.group(:stars).count
  end
end
