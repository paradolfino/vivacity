json.extract! team_member, :id, :name, :team_id, :organization_id, :created_at, :updated_at
json.url team_member_url(team_member, format: :json)
