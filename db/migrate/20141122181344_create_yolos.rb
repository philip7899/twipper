class CreateYolos < ActiveRecord::Migration
  def change
    create_table :yolos do |t|
      t.string :tweet

      t.timestamps
    end
  end
end
