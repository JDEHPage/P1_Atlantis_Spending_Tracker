require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb')
also_reload( '../models/*' )

get '/transactions' do
  @transaction = Transaction.all()
  erb ( :"transactions/index_actions")
end

get '/transaction/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb( :"transactions/show" )
end

get '/tag/new' do
  @tag = Tag.all()
  erb ( :"tags/new")
end

get '/tag/edit' do
  @tag = Tag.all()
  erb ( :"tags/edit")
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
