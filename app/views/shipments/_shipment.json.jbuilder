json.extract! shipment, :id, :order_id, :shipment_date, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
