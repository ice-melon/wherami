class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: [:mail]
  before_action :admin_user, only: [:mail]

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

  def download
    # filename = params[:filename]
    # send_file("localhost:3000/files/#{filename}",
    #           filename: "#{filename}")
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
