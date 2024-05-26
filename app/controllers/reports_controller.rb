class ReportsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def generate
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    @shipments = Shipment.where(shipment_date: start_date..end_date)
    @orders = Order.where(order_date: start_date..end_date)
  end
  def report_2023
    start_date = Date.new(2023, 1, 1)
    end_date = Date.new(2023, 12, 31)

    query = <<~SQL
    SELECT * FROM (
  SELECT orders.id, orders.order_date, orders.customer_id, NULL AS shipment_date, orders.status, 'order' AS type
  FROM orders
  WHERE orders.order_date BETWEEN $1 AND $2
  UNION
  SELECT shipments.id, NULL AS order_date, NULL AS customer_id, shipments.shipment_date, NULL AS status, 'shipment' AS type
  FROM shipments
  WHERE shipments.shipment_date BETWEEN $1 AND $2
) AS results
ORDER BY type, coalesce(order_date, shipment_date);
    SQL
    @report = ActiveRecord::Base.connection.exec_query(query, 'SQL', [start_date, end_date])
  end

  def report_2022
    start_date = Date.new(2022, 1, 1)
    end_date = Date.new(2022, 12, 31)

    query = <<~SQL
     SELECT * FROM (
  SELECT orders.id, orders.order_date, orders.customer_id, NULL AS shipment_date, orders.status, 'order' AS type
  FROM orders
  WHERE orders.order_date BETWEEN $1 AND $2
  UNION
  SELECT shipments.id, NULL AS order_date, NULL AS customer_id, shipments.shipment_date, NULL AS status, 'shipment' AS type
  FROM shipments
  WHERE shipments.shipment_date BETWEEN $1 AND $2
) AS results
ORDER BY type, coalesce(order_date, shipment_date);
    SQL
    @report = ActiveRecord::Base.connection.exec_query(query, 'SQL', [start_date, end_date])
  end
  def report_2021
    start_date = Date.new(2021, 1, 1)
    end_date = Date.new(2021, 12, 31)

    query = <<~SQL
      SELECT * FROM (
  SELECT orders.id, orders.order_date, orders.customer_id, NULL AS shipment_date, orders.status, 'order' AS type
  FROM orders
  WHERE orders.order_date BETWEEN $1 AND $2
  UNION
  SELECT shipments.id, NULL AS order_date, NULL AS customer_id, shipments.shipment_date, NULL AS status, 'shipment' AS type
  FROM shipments
  WHERE shipments.shipment_date BETWEEN $1 AND $2
) AS results
ORDER BY type, coalesce(order_date, shipment_date);
    SQL
    @report = ActiveRecord::Base.connection.exec_query(query, 'SQL', [start_date, end_date])
  end

end

