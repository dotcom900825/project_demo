class CreateArticlesTable < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :name
      t.string  :description
      t.string  :url
      t.string  :author
    end
  end
end
