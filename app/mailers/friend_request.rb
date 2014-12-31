class FriendRequest < ActionMailer::Base
  # default from: "daphy@gmail.com"

  def send_mail(to, token)
    @token = token
    mail(
      from: 'daphy@gmail.com',
      to:      to,
      subject: '[daphy]:友達申請メール'
    ) do |format|
      format.html
    end
  end
end
