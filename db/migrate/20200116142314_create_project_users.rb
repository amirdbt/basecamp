class CreateProjectUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :project_users do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :del
      t.boolean :update
      t.boolean :create
      t.boolean :read, :default => true

      t.timestamps
    end
  end
end
