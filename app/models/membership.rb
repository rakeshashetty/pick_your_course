class Membership < ActiveRecord::Base
  attr_accessible :course_id, :role_id, :user_id

  validates :course_id, :role_id, :user_id, presence: true

  belongs_to :user
  belongs_to :role
  belongs_to :program, class_name: "Program", foreign_key: "course_id"

  delegate :name, :to => :user, :prefix => true, :allow_nil => true
  delegate :name, :to => :role, :prefix => true, :allow_nil => true
  delegate :name, :to => :program, :prefix => true, :allow_nil => true
end
