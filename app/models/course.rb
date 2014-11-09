class Course < ActiveRecord::Base
  attr_accessible :name, :parent_id, :type, :description

  scope :programs, -> { where(type: 'Program') }

  validates :name, presence: true

end
