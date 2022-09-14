class CreateReadingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :reading_times do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :minutes_spend

      t.timestamps
    end
  end
end
