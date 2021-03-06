class JobCard < ActiveRecord::Base
  include IdEncryptable

  belongs_to :user, inverse_of: :my_job_cards
  belongs_to :group
  belongs_to :job_folder, inverse_of: :job_cards

  enum type: { todo: 'Todo', doing: 'Doing', done: 'Done', trashed: 'Trashed' }

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
  scope :todos, -> { todo }
  scope :doings, -> { doing }
  scope :dones, -> { done }
  scope :trashes, -> { trashed }

  def schedule_day_overdue?
    Date.current > fixed_at
  end

  concerning :Archiving do
    included do
      def self.selected_job_cards(params)
        return unless params[:job_cards_attributes][:ids]

        JobCard.where(id: params[:job_cards_attributes][:ids])
      end
    end
  end
end
