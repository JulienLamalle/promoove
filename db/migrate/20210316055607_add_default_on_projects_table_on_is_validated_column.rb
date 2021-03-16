class AddDefaultOnProjectsTableOnIsValidatedColumn < ActiveRecord::Migration[5.2]
  def change
    def change
      change_column :projects, :is_validated, :boolean, default: false
    end
  end
end
