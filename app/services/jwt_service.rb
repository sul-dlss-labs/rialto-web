# frozen_string_literal: true

# Service for encoding JWT tokens
class JwtService
  def self.encode(groups)
    # anyone who is logged in gets the "stanford" group by default, add it below
    payload = { 'exp' => Time.now.to_i + Settings.tableau.token_expiry_time_seconds,
                'jti' => SecureRandom.uuid,
                'aud' => 'tableau',
                'https://tableau.com/oda' => true,
                'https://tableau.com/groups' => groups << 'stanford' }
    header =  { 'kid' => Settings.tableau.client_secret_id,
                'iss' => Settings.tableau.client_id, 'alg' => 'HS256' }

    token = JWT::Token.new(payload: payload, header: header)
    token.sign!(algorithm: 'HS256', key: Settings.tableau.client_secret_value)
    token
  end
end
