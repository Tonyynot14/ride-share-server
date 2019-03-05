class CreateScheduleWindowExceptions < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_window_exceptions do |t|
      t.belongs_to :schedule_window
      t.boolean :is_canceled
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
  end
end
