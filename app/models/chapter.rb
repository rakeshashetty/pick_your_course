class Chapter < Course
  
  belongs_to :syllabus, class_name: "Syllabus", foreign_key: "parent_id"

  validates :parent_id, presence: true
end
