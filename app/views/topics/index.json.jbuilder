# json.array! @topics, partial: "topics/topic", as: :topic
json.topics! @topics do |topic|
  json.id topic.id
  json.title topic.title
end