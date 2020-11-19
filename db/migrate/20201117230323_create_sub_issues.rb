class CreateSubIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_issues do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.references :team_member, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :issue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
