class CreateBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :batches do |t|
      t.integer :number
      t.date    :start_date
      t.date    :end_date

      t.timestamps
    end
  end
end
