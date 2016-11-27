class AddAttachmentSubjectImgToSubjects < ActiveRecord::Migration
  def self.up
    change_table :subjects do |t|
      t.attachment :subject_img
    end
  end

  def self.down
    remove_attachment :subjects, :subject_img
  end
end
