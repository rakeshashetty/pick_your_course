class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessible :title, :body

  has_many :memberships
  has_many :students, class_name: "Membership", conditions: { role_id: Role.find_all_by_name("Student").last }
  has_many :professors, class_name: "Membership", conditions: { role_id: Role.find_all_by_name("Professor").last }
  has_many :managed_courses, class_name: "Program", through: :professors, source: :program
  has_many :enroll_courses, class_name: "Program", through: :students, source: :program

  validates :first_name, :last_name, presence: true
  
  def inline_info
    "#{first_name} #{last_name} : #{email}" 
  end

  def name
    "#{last_name}, #{first_name}"
  end 

  def student?
    students.present? 
  end

  def professor?
    professors.present?
  end

  def managed_course_ids
    managed_courses.map(&:id)
  end

  def enroll_course_ids 
    enroll_courses.map(&:id)
  end

  def admin?
    email.eql?("admin@example.com")
  end

end
