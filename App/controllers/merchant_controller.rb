require( 'sinatra' )
# require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/merchant.rb')
# also_reload( '../models/*' )

get '/merchants' do
  @merchant = Merchant.all()
  erb ( :"merchants/index_m")
end

get '/merchant/:id/edit' do
  @merchant = Merchant.find(params['id'])
  erb ( :"merchants/edit")
end

post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save
  redirect '/merchants'
end

post '/merchant/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect '/merchants'
end


post '/merchant/:id/delete' do
  Merchant.delete(params[:id])
  redirect '/merchants'
end
