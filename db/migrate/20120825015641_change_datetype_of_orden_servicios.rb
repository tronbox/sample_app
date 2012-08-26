class ChangeDatetypeOfOrdenServicios < ActiveRecord::Migration
  def up
    change_table :ordenes_servicios do |t|
      t.change :fecha_recepcion, :date
      t.change :fecha_entrega, :date
    end
  end

  def down
    change_table :ordenes_servicios do |t|
      t.change :fecha_recepcion, :datetime
      t.change :fecha_entrega, :datetime
    end

  end
end
