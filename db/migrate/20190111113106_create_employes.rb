class CreateEmployes < ActiveRecord::Migration[5.2]
  def change
    create_table :employes do |t|
      t.string :name
      t.string :email
      t.string :salary

      t.timestamps
    end
  end
end
