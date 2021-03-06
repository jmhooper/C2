Doorkeeper.configure do
  orm :active_record

  enable_application_owner confirmation: true

  resource_owner_authenticator do
    if current_user
      current_user
    else
      warden.authenticate!(scope: :user)
    end
  end
end
