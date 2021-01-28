Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '87318662732-1pj9vmr3k461mja28r842q816o1j4baa.apps.googleusercontent.com','Td_SyV_fvvc4DnYcl6cAZIZ0', skip_jwt: true
end