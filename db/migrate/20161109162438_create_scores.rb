class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.string :username
			t.integer :score
			t.integer :time
			t.string :operator
			t.integer :maxNum
      t.timestamps
    end
  end
end
