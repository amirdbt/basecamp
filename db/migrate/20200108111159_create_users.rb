class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :job_title
      t.string :location
      t.string :password

      t.timestamps
    end
  end
end
