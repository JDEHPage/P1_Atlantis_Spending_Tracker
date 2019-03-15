### Spending Tracker

Build an app that allows a user to track their spending using Ruby, Sinatra and PostgreSQL

Inspired by:
Monzo, MoneyDashboard, lots of mobile/online banking apps

### User Stories / Acceptance Criteria - MVP:

- The user should be able to create, edit and delete merchants, e.g. Tesco, Amazon, ScotRail
- The user should be able to create, edit and delete tags for their spending, e.g. groceries, entertainment, transport
- The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction.
- The app should display all the transactions a user has made in a single view, with each transaction's amount, merchant and tag, and a total for all transactions.




- navigate back to video_game_rental folder
- Type ruby app.rb in the terminal window
- App should then open in default browser...
- If app does not automatically open web address http://localhost:4567/


## Setup Server
```
Navigate to the db folder in your terminal type psql -d atlantis -f atlantis.sql to create and populate your database.
```
```
gem install sinatra sinatra-contrib
```
```
Type ruby seeds.rb and hit return (enter) this will populate the db
```

## Setup Client
```
Navigate back to Spending Tracker folder
```
```
Type ruby app.rb and hit return (enter) this should open in default browser...
```
```
If it doesn't open web address http://localhost:4567/
```
