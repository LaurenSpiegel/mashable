require 'sinatra'
require 'rest-client'


configure :development do
  set :bind, '0.0.0.0' #ok to listen to anybody
  set :port, 3000  #use localhost:3000
end

  resp = RestClient.get('http://mashable.com/stories.json') #returns json as a string
  doc = JSON.parse(resp) #turns string into a hash

get '/' do
  @stories = doc['new'] #grabbing new array from the mashable json and storing it in instance variable stories
  
 
  erb :homesort
end


get '/channel' do
  @stories = doc['new'] #grabbing new array from the mashable json and storing it in instance variable stories
  
  #create channels array in order to sort by channel in view
  channels = Array.new
  @stories.each do |story|
    channels << story['channel']
  end

  @channels = channels.uniq.sort
 
  erb :channel
  
end

get '/author' do
  @stories = doc['new'] #grabbing new array from the mashable json and storing it in instance variable stories
  
  #create authors array in order to sort by author in view
  authors = Array.new
  @stories.each do |story|
    authors << story['author']
  end

  @authors = authors.uniq.sort
 
  erb :author
  
end






