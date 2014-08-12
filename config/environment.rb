# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SampleApp::Application.initialize!


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'mail.google.com',
    :port           => 587,
    :user_name      => 'wherami.mtrec@gmail.com',
    :password       => 'mtrec2014',
    :authentication => :plain,
    :enable_starttls_auto => true
}
