GrapeSwaggerRails.options.yield_self do |options|
  options.app_name = "ZeroToHero"
  options.url      = "/swagger_doc.json"
  options.app_url  = "http://zerotohero.local"

  options.api_auth = "bearer"
  options.api_key_name = "Authorization"
  options.api_key_type = "header"
  options.before { |request| options.api_key = current_user.api_key }
end
