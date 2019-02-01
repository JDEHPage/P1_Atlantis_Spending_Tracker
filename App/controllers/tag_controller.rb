require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb')
also_reload( '../models/*' )

get '/tag' do
  @tag = Tag.all()
  erb ( :"tags/index")
end

get '/tag/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb( :"tags/show" )
end
