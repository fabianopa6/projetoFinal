class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.integer :score
      t.integer :rating
      t.text :prof_answer

      t.timestamps null: false
    end
  end
end
