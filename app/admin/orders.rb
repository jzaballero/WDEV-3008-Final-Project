# frozen_string_literal: true

ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :status_id
  permit_params :PST_total, :GST_total, :HST_total, :subtotal
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :status_id, :PST_total, :GST_total, :HST_total, :subtotal]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
