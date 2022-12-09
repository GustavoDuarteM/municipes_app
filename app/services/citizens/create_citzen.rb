module Citizens
  class CreateCitzen
    attr :params

    def initialize(params)
      @params = params
    end

    def call
      citizen = Citizen.new(params)
      if citizen.save
        send_mail(citizen)
        true
      else
        citizen.errors.messages
      end
    end

    private

    def send_mail(citizen)
      Citizens::NotfyNewCitizen.new(citizen).call
    end
  end
end