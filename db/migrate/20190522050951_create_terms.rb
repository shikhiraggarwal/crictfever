class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.text :term

      t.timestamps
    end
  end
end
