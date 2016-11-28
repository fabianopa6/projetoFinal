class Task < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
end
