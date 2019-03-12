class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :memo
      t.string :is_display, default: true
      t.string :boolean
      t.integer :status

      t.timestamps
    end
  end
end
