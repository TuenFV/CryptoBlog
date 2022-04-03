class UserMailer < ApplicationMailer
  include Devise::Controllers::UrlHelpers
  default from: "no-reply@myinvest.com"

  def remind_vesting_date
    @user = params[:user]
    @pool = params[:pool]
    @vesting = params[:vesting]
    @url = "https://my-invests.herokuapp.com/pools/#{@pool.id}/vestings/#{@vesting.id}/edit"
    mail(to: @user.email, subject: "[New Vesting] #{@pool.project} Tomorrow!")
  end

  def notify_new_pool_create
    @user = params[:user]
    @url = "http://localhost:3000/users/sign_in"
    mail(to: @user.email, subject: "New pool on MyInvest!")
  end
end
