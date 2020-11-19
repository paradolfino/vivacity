class Issue < ApplicationRecord
  belongs_to :team_member
  belongs_to :project
  belongs_to :organization
  belongs_to :team
end
