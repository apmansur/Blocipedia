class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.references :wiki, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
