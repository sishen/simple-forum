Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, fields: [:name, :email], on_failed_registration: UsersController.action(:new)
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_SECRET"]
end
