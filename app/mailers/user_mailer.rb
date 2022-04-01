class UserMailer < ApplicationMailer
  include Devise::Controllers::UrlHelpers
  default from: "tuyen-user@gmail.com"

  def remind_vesting_date
    @user = params[:user]
    @url = "http://localhost:3000/pools"
    mail(to: @user.email, subject: "New vesting coming tomorrow!")
  end

  def notify_new_vesting
    @user = params[:user]
    @url = "http://localhost:3000/"
    mail(to: @user.email, subject: "New vesting added!")
  end

  def notify_new_pool
    @user = params[:user]
    @url = "http://localhost:3000/users/sign_in"
    mail(to: @user.email, subject: "New pool on MyInvest!")
  end
end
