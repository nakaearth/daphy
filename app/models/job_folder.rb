class JobFolder < ActiveRecord::Base
  belongs_to :group
  has_many :job_cards, inverse_of: :job_folder
  accepts_nested_attributes_for :job_cards, allow_destroy: true

  validates :name, presence: true, length: { maximum: 50 }

  alias_method :archive, :save

  def to_key
    [Base64.encode64(id.to_s)]
  end

  def to_param
    [Base64.encode64(id.to_s)]
  end
end
