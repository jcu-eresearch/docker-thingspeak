# Load the rails application
require File.expand_path('../application', __FILE__)

Thingspeak::Application.configure do
    config.action_controller.perform_caching = true
    config.cache_store = :file_store, "#{Rails.root}/tmp/cache"

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :address => 'hostrelay.jcu.edu.au',
        :port => 25,
#        :domain => '',
        :enable_starttls_auto => true
    }
end

# Initialize the rails application
Thingspeak::Application.initialize!
