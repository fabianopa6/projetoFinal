class Answer < ActiveRecord::Base
  belongs_to :task
  belongs_to :subject
  belongs_to :user
end
