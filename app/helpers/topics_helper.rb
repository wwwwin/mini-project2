module TopicsHelper

  def render_reviews_count(topic)
    return "沒有留言" if topic.reviews_count == 0
    "#{topic.reviews_count} 則留言"
  end
end
