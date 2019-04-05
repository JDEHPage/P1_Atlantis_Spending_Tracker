require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/budget_cat.rb')
also_reload( '../models/*' )

get '/budget/:id/edit' do
  @tag = Tag.all()
  @budget = Budget.find(params['id'])
  erb ( :"budgets/edit")
end

get '/budget/new' do
  @budget = Budget.all()
  @tag = Tag.all()
  erb ( :"budgets/new")
end

post '/budgets' do
  budget = Budget.new(params)
  budget.save
  redirect '/transactions'
end

post '/budgets/:id' do
  budget = Budget.new(params)
  budget.update
  redirect '/transactions'
end

post '/budget/:id/delete' do
  Budget.delete(params[:id])
  redirect '/transactions'
end
