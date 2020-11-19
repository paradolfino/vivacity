class Sprint < ApplicationRecord
  belongs_to :project
  belongs_to :team
  belongs_to :organization
end
