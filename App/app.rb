require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/merchant_controller')
require_relative('controllers/tag_controller')
require_relative('controllers/transaction_controller')
require_relative('controllers/budget_cat_controller')

get '/' do
  @transaction = Transaction.all()
  erb( :index )
end
