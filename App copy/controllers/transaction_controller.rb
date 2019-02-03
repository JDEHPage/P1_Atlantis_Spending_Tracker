require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb')
also_reload( '../models/*' )

get '/transactions' do
  @transaction = Transaction.all()
  erb ( :"transactions/index_actions")
end

get '/transaction/new' do
  @transaction = Transaction.all()
  erb ( :"transactions/new")
end

get '/transaction/:id' do
  @transaction = Transaction.find(params['id'])
  erb( :"transactions/show" )
end

# get '/victims/:id' do
#   @victim = Victim.find(params['id'].to_i)
#   erb( :"victims/show" )
# end

get '/transaction/:id/edit' do
  @transaction = Transaction.find(params['id'])
  erb ( :"transactions/edit")
end





post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect '/transactions'
end

post '/transaction/:id/delete' do
  Transaction.delete(params[:id])
  redirect '/transactions'
end
