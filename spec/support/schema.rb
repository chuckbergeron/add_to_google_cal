ActiveRecord::Schema.define do

  self.verbose = false

  create_table :weddings, :force => true do |t|
    t.string :summary
    t.datetime :dtstart
    t.datetime :dtend

    t.timestamps
  end

end
