json.extract! route, :id, :name, :grade_id, :level_id, :posx, :posy, :score, :created_at, :updated_at
json.url route_url(route, format: :json)
