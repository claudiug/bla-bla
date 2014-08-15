require_relative '../lib/twitter_client'
require 'byebug'

describe TwitterClient  do

  it 'should create a valid object with a given name' do
    client = TwitterClient.new('d')
    expect(client).to be_truthy
  end


  it 'should return tweets for a given user' do
    client = TwitterClient.new('claudiuinberlin')
    expect(client.tweets).to be_a(Array)
    expect(client.tweets.size).to_not eq 0
  end

  it 'should return list followers for a user' do
    client = TwitterClient.new('claudiuinberlin')
    expect(client.followers).to be_a(Array)
    expect(client.followers.first['name']).to match('James Saunders')
  end

  it 'should return a list with favorites tweets for a given user' do
    client = TwitterClient.new('claudiuinberlin')
    expect(client.favorites.first['text']).to match('')
  end

  it 'should help claudiu understand stub' do
    connection = double
    response = double
    expect(response).to receive(:body).and_return("{\"users\":\"foo\"}")
    allow(OAuth::Consumer).to receive(:new).with(any_args)
    allow(OAuth::AccessToken).to receive(:from_hash).with(any_args).and_return(connection)
    expect(connection).to receive(:request).with(:get, 'https://api.twitter.com/1.1/followers/list.json?cursor=-1&screen_name=foo&skip_status=true&include_user_entities=false')
                          .and_return(response)

    twitter_client = TwitterClient.new('foo')
    expect(twitter_client.followers).to eq('foo')
  end

end
