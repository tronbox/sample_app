class AddResponsableToArea < ActiveRecord::Migration
  def change
    add_column :areas, :responsable, :string
  end
end
