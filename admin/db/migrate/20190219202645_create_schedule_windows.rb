class CreateScheduleWindows < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_windows do |t|
      t.belongs_to :driver
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.belongs_to :location
      t.boolean :is_recurring

    end
  end
end
