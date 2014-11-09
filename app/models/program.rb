class Program < Course
  
  has_many :syllabuses, class_name: "Course", foreign_key: "parent_id"
end
