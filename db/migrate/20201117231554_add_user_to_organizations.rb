class AddUserToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_reference :organizations, :user, null: false, foreign_key: true
  end
end
