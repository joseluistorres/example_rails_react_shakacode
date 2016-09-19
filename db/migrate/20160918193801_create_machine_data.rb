class CreateMachineData < ActiveRecord::Migration[5.0]
  def change
    create_table :machine_data do |t|
      t.string :name
      t.jsonb :preread_json
      t.belongs_to :user, index: true
      t.foreign_key :users

      t.timestamps
    end
  end
end
