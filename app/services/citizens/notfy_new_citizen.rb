module Citizens
  class NotfyNewCitizen < Mailer::Base::SendblueMailerBase
    attr :citizen

    def initialize(citizen)
      @citizen = citizen
    end

    def call
      name = citizen.full_name
      email = citizen.email
      subject = 'Você está cadastrado(a)'
      send_mail(name, email, subject, html_content)
    end

    private

    def html_content
      ActionController::Base.new.render_to_string("citizens_mailer/notfy_new_citizen", layout: false, locals: { citizen: citizen })
    end
  end
end