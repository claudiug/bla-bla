require 'oauth'
require 'json'
class TwitterClient

  attr_reader :user

  def initialize(user)
    @user = user
    token = '2617802185-94zZikE7dVDlPBN7beFhngn4t4IkClEeUkflVht'
    token_secret = 'DmrN82p8415xIF3j6vHVgaxjUmoW3FfEB7q9q9aeCKE9I'
    @connection = prepare_access_token(token, token_secret)
  end

  def followers
    response = @connection.request(:get,
                                   "https://api.twitter.com/1.1/followers/list.json?cursor=-1&screen_name=#{user}&skip_status=true&include_user_entities=false")
    JSON.parse(response.body)['users']

  end

  def tweets
    response = @connection.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?#{user}")
    return parse_response(response)
  end

  def favorites
    response = @connection.request(:get, "https://api.twitter.com/1.1/favorites/list.json?count=2&screen_name=#{user}")
    return parse_response(response)
  end

  private

  def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new('xtjmMFyBbB2jvM35YDjtu7D1I', '84kqOqLpOIGXJE2ABLr1Cz2fQVHtusjBbkH5DgrwDLch3Mkydc',
                                   {site: 'https://api.twitter.com',
                                    scheme: :header
                                   })

    token_hash = {oauth_token: oauth_token,
                   oauth_token_secret: oauth_token_secret
    }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
    return access_token
  end

  def parse_response(response)
    byebug
    JSON.parse(response.body)
  end
end

