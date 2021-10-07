class CreateCovids < ActiveRecord::Migration[6.1]
  def change
    create_table :covids do |t|
      t.string :nation
      t.float :new_cases
      t.float :new_deaths
      t.float :new_recoveries
      t.float :new_injections

      t.timestamps
    end
  end
end
