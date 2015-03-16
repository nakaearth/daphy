class JobFolder < ActiveRecord::Base
  belongs_to :group

  validates :name, length: { maximum: 50 }
end
