class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.references :user
      t.string :agent
      t.datetime :start_time

      t.timestamps
    end
  end
end
