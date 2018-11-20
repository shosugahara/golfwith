class TesMailer < ApplicationMailer
  def send_mail(user)
    mail(to: user.email,subject: "テストです")
  end
end
