

if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: "_session_id",  domain: ".wreck-house-press-back.herokuapp.com"
else 
  Rails.application.config.session_store :cookie_store, key: "_session_id", expire_after: 14.hours
end