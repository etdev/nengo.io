class CreateNengos < ActiveRecord::Migration
  def change
    create_table :nengos do |t|
      t.string :year_seireki
      t.timestamps null: false
    end
  end
end
