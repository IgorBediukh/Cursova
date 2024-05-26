class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references :order, null: false, foreign_key: true
      t.date :shipment_date

      t.timestamps
    end
  end
end
