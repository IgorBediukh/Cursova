ActiveAdmin.register User do
  # Дозволяємо параметри, які можуть бути передані через форми
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :role

  # Інший спосіб дозволу параметрів
  permit_params do
    permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :role]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :created_at
    column :updated_at
    actions
  end

  filter :email
  filter :role
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :role
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end


