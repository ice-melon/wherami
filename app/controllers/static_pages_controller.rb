class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: [:download]

  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def guide
    @address = "localhost:3000"
  end

  def download
    filename = params[:filename]
    send_file("localhost:3000/files/#{filename}",
              filename: "#{filename}")
  end
end
