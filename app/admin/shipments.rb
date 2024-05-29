ActiveAdmin.register Shipment do
  # Дозволяє параметри, які можуть бути передані через форми
  permit_params :order_id, :shipment_date

  permit_params do
    permitted = [:order_id, :shipment_date]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  index do
    selectable_column
    id_column
    column :order
    column :shipment_date
    column :created_at
    column :updated_at
    actions
  end

  filter :order
  filter :shipment_date
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :order
      f.input :shipment_date, as: :datepicker
    end
    f.actions
  end

  show do
    attributes_table do
      row :order
      row :shipment_date
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
