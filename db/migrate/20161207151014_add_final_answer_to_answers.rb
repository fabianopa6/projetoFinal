class AddFinalAnswerToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :final_answer, :text
  end
end
