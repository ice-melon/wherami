class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: [:mail]
  before_action :admin_user, only: [:mail,:updateMail]

  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def guide

  end

  def sdk
    
  end

  def summary
    
  end

  def registration
    
  end

  def download

  end

  def mail
    
  end

  def updateMail
    @mailList = User.all
    @mailList.each { |user|
        UserMailer.update_email(user).deliver
    }
    flash[:success] = "mail has send! Don't send it again!"
    render 'mail'
  end

end
