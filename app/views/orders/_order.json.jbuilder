json.extract! order, :id, :customer, :order_date, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
