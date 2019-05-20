ActiveAdmin.register Player do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :email, :phone, :points, :pincode, :password, :data, :device, :share_code
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone
    column :points
    column :pincode
    column :device
    column :share_code
    column :created_at
    actions
  end

end
