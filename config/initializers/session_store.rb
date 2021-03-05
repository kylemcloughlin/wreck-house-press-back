if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: "_wreck_house_weekly",  domain: "https://wreck-house-press-back.herokuapp.com/"
else 
  Rails.application.config.session_store :cookie_store, key: "_wreck_house_weekly"
end