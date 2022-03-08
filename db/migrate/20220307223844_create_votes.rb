class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer     :value
      t.string      :session_id
      t.references  :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
