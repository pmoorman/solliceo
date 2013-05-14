ActiveAdmin.register User do
  index do
  	column :name do |user|
  		link_to user.name, admin_user_path(user)
  	end
  	column :email
  	column :last_sign_in_at
  	column :videoid
  	default_actions #Show 'view', 'edit' and 'delete' options
  end

  form do |f|
  f.inputs "Details" do
    f.input :email
    f.input :videoid
  end
  f.buttons
end
end
