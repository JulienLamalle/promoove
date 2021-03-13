class AddInformationsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :description, :text
    add_column :users, :professional_background, :text
    add_column :users, :github_link, :string
    add_column :users, :gitlab_link, :string
    add_column :users, :twitter_link, :string
    add_column :users, :linkedin_link, :string
  end
end
