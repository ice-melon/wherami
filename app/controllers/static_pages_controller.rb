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

  end

  def download
    filename = params[:filename]
    send_file("#{Rails.root}/files/#{filename}",
              filename: "#{filename}")
  end
end
