ActiveAdmin.register Order do
  permit_params :customer_id, :order_date, :status

  index do
    selectable_column
    id_column
    column :customer
    column :order_date
    column :status
    column :created_at
    column :updated_at
    actions
  end

  filter :customer
  filter :order_date
  filter :status
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :customer
      f.input :order_date, as: :datepicker
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :customer
      row :order_date
      row :status
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
