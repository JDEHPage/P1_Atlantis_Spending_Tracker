require( 'sinatra' )
# require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb')
# also_reload( '../models/*' )

get '/tags' do
  @tag = Tag.all()
  erb ( :"tags/index_t")
end

get '/tag/:id/edit' do
  @tag = Tag.find(params['id'])
  erb ( :"tags/edit")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect '/tags'
end

post '/tag/:id' do
  tab = Tag.new(params)
  tab.update
  redirect '/tags'
end


post '/tag/:id/delete' do
  Tag.delete(params[:id])
  redirect '/tags'
end
