class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user
      t.references :role
      t.references :course

      t.timestamps
    end
  end
end
