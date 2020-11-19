json.extract! issue, :id, :name, :description, :status, :team_member_id, :project_id, :organization_id, :team_id, :created_at, :updated_at
json.url issue_url(issue, format: :json)
