class PassengerMailer < ApplicationMailer
  default from: "notifications@example.com"

  def confirmation_email
    @user = params[:user]
    @flight = params[:flight]
    mail(to: @user.email, subject: "Booking Confirmation")
  end
end
