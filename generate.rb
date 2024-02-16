require 'jwt'
require 'json'
require 'openssl'

def generate_jwt(jwk_file_path, private_key)
  # Load the JWK from the file
  jwk_data = JSON.parse(File.read(jwk_file_path))

  # Explicitly set the algorithm to RS256 (or the correct algorithm)
  algorithm = 'RS256'

  # Set the expiration time to 1 hours from the current time
  exp_time = Time.now.to_i + 1 * 60 * 60

  # Create a JWT token with the exp claim
  jwt_token = JWT.encode(
    {
      aud: 'https://deptva-eval.okta.com/oauth2/aus8nm1q0f7VQ0a482p7/v1/token',
      sub: '0oasb7er3kqqNYeLE2p7',
      iss: '0oasb7er3kqqNYeLE2p7',
      exp: exp_time
    },
    private_key,
    algorithm,
    { kid: jwk_data['kid'] }
  )

  jwt_token
end

# Example usage
jwk_file_path = '../../public.jwk'
private_key_file_path = '../../private.pem'
private_key = OpenSSL::PKey::RSA.new(File.read(private_key_file_path))

jwt_token = generate_jwt(jwk_file_path, private_key)
puts "Generated JWT Token: #{jwt_token}"
