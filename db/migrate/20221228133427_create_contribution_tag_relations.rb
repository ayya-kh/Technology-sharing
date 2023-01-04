class CreateContributionTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :contribution_tag_relations do |t|
      t.integer :contribution_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
