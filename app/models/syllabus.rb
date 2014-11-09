class Syllabus < Course
  
  has_many :chapters, class_name: "Chapter", foreign_key: "parent_id"
  belongs_to :program, class_name: "Program", foreign_key: "parent_id"

  validates :parent_id, presence: true
end
