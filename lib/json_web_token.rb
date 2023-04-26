require 'jwt'

class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    HashWithIndifferentAccess.new decoded
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    raise ExceptionHandler::ExpiredSignature, e.message
  end
end
