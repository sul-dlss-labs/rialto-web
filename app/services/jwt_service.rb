# frozen_string_literal: true

# Service for encoding JWT tokens
class JwtService
  ALGORITHM = 'HS256'

  def self.encode(groups)
    new.encode(groups)
  end

  def encode(groups)
    # anyone who is logged in is part of the stanford group as far as tableau is concerned
    groups << 'stanford' unless groups.include?('stanford')
    payload = { 'exp' => Time.now.to_i + Settings.tableau.token_expiry_time_seconds,
                'jti' => SecureRandom.uuid,
                'iss' => Settings.tableau.client_id,
                'aud' => 'tableau',
                'sub' => Settings.tableau.username,
                'scp' => ['tableau:views:embed'] }
    JWT.encode(payload, Settings.tableau.client_secret_value, ALGORITHM, header)
  end

  private

  def header
    { 'kid' => Settings.tableau.client_secret_id }
  end
end
