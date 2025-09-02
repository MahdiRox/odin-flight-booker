class PassengerMailer < ApplicationMailer
  default from: 'no-reply@example.com'
  layout 'mailer'
  def confirmation_email(passenger)
    @passenger = params[:passenger] || passenger
    mail(to: @passenger.email, subject: "booking notification")
  end
end
