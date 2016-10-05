json.extract! user, :id, :Username, :Password, :Name, :avatar, :created_at, :updated_at
json.url user_url(user, format: :json)