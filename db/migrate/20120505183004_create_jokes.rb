class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.text :buildup
      t.text :punchline

      t.timestamps
    end
  end
end
