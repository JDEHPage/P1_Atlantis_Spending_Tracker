require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb')
also_reload( '../models/*' )

get '/tags' do
  @tag = Tag.all()
  erb ( :"tags/index_t")
end

get '/tag/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb( :"tags/show" )
end

get '/tag/edit' do
  @tag = Tag.all()
  erb ( :"tags/edit")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect '/tags'
end

post '/tab/:id' do
  tab = Merchant.new(params)
  tab.update
  redirect '/tabs'
end


post '/tag/:id/delete' do
  Tag.delete(params[:id])
  redirect '/tags'
end
