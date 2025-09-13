class PassengerMailer < ApplicationMailer
  default from: 'zohrafarid3123@gmail.com'
  layout 'mailer'
  def confirmation_email
    @passenger = params[:passenger] 
    mail(to: @passenger.email, subject: "booking notification")
  end
end
