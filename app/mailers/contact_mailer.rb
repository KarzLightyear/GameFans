class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: ENV['TOMAIL'],
         subject: '【お問い合わせ】' + @contact.subject,
         body:
    @contact.name + '様 から問い合わせがありました。' + "\r\n" + '【用件】：' + @contact.subject + "\r\n" + '【お問い合わせ内容】' + @contact.message
  end
end
