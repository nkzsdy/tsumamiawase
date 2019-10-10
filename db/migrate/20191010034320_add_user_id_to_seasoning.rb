class AddUserIdToSeasoning < ActiveRecord::Migration[6.0]
  def change
    add_reference :seasonings, :user, null: false, foreign_key: true
  end
end
