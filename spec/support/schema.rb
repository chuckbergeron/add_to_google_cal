ActiveRecord::Schema.define do

  self.verbose = false

  create_table :weddings, :force => true do |t|
    t.string :summary
    t.datetime :dtstart
    t.datetime :dtend

    t.timestamps
  end

  create_table :event_non_standard_columns, :force => true do |t|
    t.string :event_name
    t.datetime :start_time
    t.datetime :end_time

    t.timestamps
  end

end
