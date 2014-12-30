class InviteGroup < ActionMailer::Base
  # default from: "daphy@gmail.com"

  def send_mail(to, token)
    @token = token
    mail(
      from: 'daphy@gmail.com',
      to:      to,
      subject: '[daphy]:グループ招待のメール'
    ) do |format|
      format.html
    end
  end
end
