class JobCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :title, presence: true, length: { maximum: 80 }
end
