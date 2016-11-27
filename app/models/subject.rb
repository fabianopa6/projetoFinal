class Subject < ActiveRecord::Base

	belongs_to :user
	belongs_to :semester

	has_attached_file :subject_img, styles: { subject_index: "250x350>", subject_show: "325x475>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :subject_img, content_type: /\Aimage\/.*\z/
end
