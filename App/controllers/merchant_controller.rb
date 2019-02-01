require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/merchant.rb')
also_reload( '../models/*' )

get '/merchant' do
  @merchant = Merchant.all()
  erb ( :"merchants/index")
end

get '/merchant/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb( :"merchants/show" )
end
