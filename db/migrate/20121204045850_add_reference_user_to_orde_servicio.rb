class AddReferenceUserToOrdeServicio < ActiveRecord::Migration
  def change
    add_column :ordenes_servicios, :user_id, :integer
    add_index  :ordenes_servicios, :user_id
  end
end
