class CreateReminder < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.column :description, :text
      t.timestamps
    end
  end
end
