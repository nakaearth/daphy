class JobCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  with_options on: :todo do
    validates :title, presence: true, length: { maximum: 80 }
    validates :description, length: { maximum: 256 }
    validates :point, presence: true, numericality: true
  end

  with_options on: :doing do
    validates :title, presence: true, length: { maximum: 80 }
    validates :description, length: { maximum: 256 }
  end

  default_scope { order(id: :desc) }
  scope :todos, -> { where(type: 'Todo') }
  scope :doings, -> { where(type: 'Doing') }
  scope :dones, -> { where(type: 'Done') }
  scope :trashes, -> { where(type: 'Trashed') }
end
