class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :preview_video_url
      t.string :runtime
      t.text :synopsis
      t.integer :avg_score

      t.timestamps
    end
  end
end
