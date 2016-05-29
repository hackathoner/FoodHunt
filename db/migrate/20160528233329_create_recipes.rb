class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string      :title,    :null => false
      t.string      :tagline,  :null => false
      t.string      :link,     :null => false
      t.string      :image
      t.integer     :votes_count, :default => 0

      t.belongs_to  :user,     :null => false, :index => true

      t.timestamps null: false
    end
  end
end
