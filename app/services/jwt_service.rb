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

    token = JWT::Token.new(payload: payload(groups), header: header)
    token.sign!(algorithm: ALGORITHM, key: Settings.tableau.client_secret_value)
    token
  end

  private

  def payload(groups)
    { 'exp' => Time.now.to_i + Settings.tableau.token_expiry_time_seconds,
      'jti' => SecureRandom.uuid,
      'aud' => 'tableau',
      'scp' => ['tableau:views:embed'],
      'https://tableau.com/oda' => true,
      'https://tableau.com/groups' => groups }
  end

  def header
    { 'kid' => Settings.tableau.client_secret_id,
      'iss' => Settings.tableau.client_id,
      'alg' => ALGORITHM }
  end
end
