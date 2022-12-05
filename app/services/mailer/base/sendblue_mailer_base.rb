module Mailer
  module Base
    class SendblueMailerBase
      def send_mail(name, email, subject, html_content)
        smtp_email = send_smtp_email(name, email, subject)
        smtp_email.html_content = html_content
        SibApiV3Sdk::TransactionalEmailsApi.new.send_transac_email(smtp_email)
      rescue SibApiV3Sdk::ApiError => e
        puts "Exception when calling TransactionalEmailsApi->send_transac_email: #{e}"
      end

      private

      def send_smtp_email(name, email, subject)
        SibApiV3Sdk::SendSmtpEmail.new(
          sender: SibApiV3Sdk::SendSmtpEmailSender.new(
            name: 'Gustavo',
            email: 'gustavo_dmuniz@hotmail.com'
          ),
          to: [SibApiV3Sdk::SendSmtpEmailTo.new(
            name: name,
            email: email
          )],
          subject: subject
        )
      end
    end
  end
end