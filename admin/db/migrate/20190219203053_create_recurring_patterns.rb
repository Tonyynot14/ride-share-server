class CreateRecurringPatterns < ActiveRecord::Migration[5.2]
  def change
    create_table :recurring_patterns do |t|
      t.belongs_to :schedule_window
      t.integer :day_of_week
      t.timestamps
    end
  end
end
