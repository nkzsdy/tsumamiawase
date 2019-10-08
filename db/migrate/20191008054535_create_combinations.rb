class CreateCombinations < ActiveRecord::Migration[6.0]
  def change
    create_table :combinations do |t|
      t.references :user,       null: false, foreign_key: true, index: true
      t.references :ingredient, null: false, foreign_key: true, index: true
      t.references :seasoning,  null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
