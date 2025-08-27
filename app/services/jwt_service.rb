# frozen_string_literal: true

# Service for encoding JWT tokens
class JwtService
  def self.encode(groups)
    # anyone who is logged in is part of the stanford group as far as tableau is concerned
    groups << 'stanford' unless groups.include?('stanford')

    payload = { 'exp' => Time.now.to_i + Settings.tableau.token_expiry_time_seconds,
                'jti' => SecureRandom.uuid,
                'aud' => 'tableau',
                'https://tableau.com/oda' => true,
                'https://tableau.com/groups' => groups }
    header =  { 'kid' => Settings.tableau.client_secret_id,
                'iss' => Settings.tableau.client_id, 'alg' => 'HS256' }

    token = JWT::Token.new(payload: payload, header: header)
    token.sign!(algorithm: 'HS256', key: Settings.tableau.client_secret_value)
    token
  end
end
