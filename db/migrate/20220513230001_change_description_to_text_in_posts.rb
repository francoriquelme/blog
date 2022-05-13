class ChangeDescriptionToTextInPosts < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :posts do |t|
        dir.up { t.change :description, :text }
        dir.down { t.change :description, :string }
      end
    end
  end
end
