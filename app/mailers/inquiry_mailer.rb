class InquiryMailer < ActionMailer::Base
  default from: "example@example.com"   # 送信元アドレス
  default to: "example@example.com"     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'リクエストを承りました')
  end

end