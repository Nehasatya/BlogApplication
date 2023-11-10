json.extract! @topic, :id, :title
json.message "Your Topic Successfully created"
json.status :created
json.location @topic