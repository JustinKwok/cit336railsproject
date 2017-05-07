class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :due_date
      t.text :class_name
      t.text :description

      t.timestamps
    end
  end
end
