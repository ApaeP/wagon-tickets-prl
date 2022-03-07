class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string      :name
      t.string      :avatar_url
      t.integer     :kitt_id
      t.integer     :global_score, default: 0
      t.references  :batch, foreign_key: true, null: false

      t.timestamps
    end
  end
end
