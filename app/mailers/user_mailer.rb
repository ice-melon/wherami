class UserMailer < ActionMailer::Base
  default from: "wherami.mtrec@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://example.com/login'
  	email_with_name = "#{@user.name} <#{@user.email}>"
  	mail(to: email_with_name, subject: 'Welcome to Wherami')
  end


  def update_email(user)
  	@user = user
  	email_with_name = "#{@user.name} <#{@user.email}>"
  	mail(to: email_with_name, subject: 'Wherami API Has Updated')
  end
end
