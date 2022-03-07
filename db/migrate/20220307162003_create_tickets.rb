class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.text        :content
      t.integer     :score, default: 0
      t.references  :student, foreign_key: true, null: false

      t.timestamps
    end
  end
end
