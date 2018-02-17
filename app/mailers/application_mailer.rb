class ApplicationMailer < ActionMailer::Base
  default from: ENV["COMPANY_EMAIL"]
  layout 'mailer'
end
