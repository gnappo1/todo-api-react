class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :body
      t.boolean :completed
      t.string :completion_time
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
