class AddParamsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :description, :text
    add_column :companies, :website, :string
    add_column :companies, :markets, :string
    add_column :companies, :location, :string
  end
end
