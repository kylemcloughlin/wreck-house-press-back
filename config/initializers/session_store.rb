if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: "_wreck_house-press-back_session",  domain: "https://wreck-house-press-back.herokuapp.com/"
else 
  Rails.application.config.session_store :cookie_store, key: "_wreck_house_press_back_session", expire_after: 14.hours
end