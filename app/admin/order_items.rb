ActiveAdmin.register OrderItem do
  permit_params :order_id, :analysis_id, :quantity

  index do
    selectable_column
    id_column
    column :order
    column :analysis
    column :quantity
    column :created_at
    column :updated_at
    actions
  end

  filter :order
  filter :analysis
  filter :quantity
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :order
      f.input :analysis
      f.input :quantity
    end
    f.actions
  end

  show do
    attributes_table do
      row :order
      row :analysis
      row :quantity
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
