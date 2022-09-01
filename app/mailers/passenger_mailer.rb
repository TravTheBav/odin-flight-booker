class PassengerMailer < ApplicationMailer
  default from: 'notifications@odin-flight-booker.com'

  def confirmation_email
    @passenger = params[:passenger]
    @url = 'http://odin-flight-booker.com/login'
    mail(to: @passenger, subject: 'Your flight confirmation')
  end
end
