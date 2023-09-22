module RatingsHelper
  def star_rating_class(rating, index)
    if index < rating.stars
      "fill-yellow-400 stroke-yellow-400"
    else
      "fill-transparent stroke-gray-400"
    end
  end
end
