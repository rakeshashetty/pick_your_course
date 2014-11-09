class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :parent_id
      t.string :type

      t.timestamps
    end
  end
end
