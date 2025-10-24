# frozen_string_literal: true

# Service for encoding JWT tokens
class JwtService
  ALGORITHM = 'HS256'

  def self.encode
    new.encode
  end

  def encode
    JWT.encode(payload, Settings.tableau.client_secret_value, ALGORITHM, header)
  end

  private

  def payload
    # anyone who is logged in is part of the stanford group as far as tableau is concerned
    { 'exp' => Time.now.to_i + Settings.tableau.token_expiry_time_seconds,
      'jti' => SecureRandom.uuid,
      'iss' => Settings.tableau.client_id,
      'aud' => 'tableau',
      'sub' => Current.user.sunetid,
      'scp' => ['tableau:views:embed'] }
  end

  def header
    { 'kid' => Settings.tableau.client_secret_id,
      'iss' => Settings.tableau.client_id,
      'alg' => ALGORITHM }
  end
end
