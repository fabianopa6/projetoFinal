class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :semester

      t.timestamps null: false
    end
  end
end
