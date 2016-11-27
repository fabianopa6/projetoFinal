class RemoveSemesterFromSubjects < ActiveRecord::Migration
  def change
    remove_column :subjects, :semester, :string
  end
end
