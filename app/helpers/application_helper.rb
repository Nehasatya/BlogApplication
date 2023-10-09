module ApplicationHelper
  def stars_count(post)
    post.ratings.all.group(:stars).count
  end


  def check_user_read_status(user,post)
    all_posts_of_user = user.posts
    if all_posts_of_user.include?(post)
      return "Read"
    else
      return "Unread"
    end
  end



end
