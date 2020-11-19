json.extract! sub_issue, :id, :name, :description, :status, :team_member_id, :project_id, :organization_id, :team_id, :issue_id, :created_at, :updated_at
json.url sub_issue_url(sub_issue, format: :json)
