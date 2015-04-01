class JobFolder < ActiveRecord::Base
  belongs_to :group
  has_many :job_cards
  accepts_nested_attributes_for :job_cards, allow_destroy: true

  validates :name, presence: true, length: { maximum: 50 }

  alias_method :archive, :save
end
