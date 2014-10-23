class JobCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  with_options on: :todo do |todo|
    validates :title, presence: true, length: { maximum: 80 }
    validates :description, length: { maximum: 256 }
    validates :point, presence: true, numericality: true
  end

  with_options on: :doing do |doing|
    validates :title, presence: true, length: { maximum: 80 }
    validates :description, length: { maximum: 256 }
  end

  scope :latest, -> { order(id: :desc) }
end
