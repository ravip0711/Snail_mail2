class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.belongs_to :user
      t.string :subject
      t.string :from
      t.text :body
      t.datetime :time_recieved
    end
  end
end
