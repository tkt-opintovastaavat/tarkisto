class CreateCodeSnippets < ActiveRecord::Migration

  def self.up
    create_table :code_snippets do |t|
      t.string :text
      t.references :question
      t.timestamps
    end
  end

  def self.down
    drop_table :code_snippets
  end

end
