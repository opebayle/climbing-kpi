json.extract! user, :id, :login, :role, :email, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
