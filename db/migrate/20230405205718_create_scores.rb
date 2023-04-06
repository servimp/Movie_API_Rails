class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :score
      t.integer :user_id
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
