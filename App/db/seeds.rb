require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
require('pry')

merchant1 = Merchant.new({
  "name" => "Tesco"
  })

merchant2 = Merchant.new({
  "name" => "Subway"
  })

merchant1.save()
merchant2.save()

tag1 = Tag.new({
  "name" => "Groceries"
  })

tag2 = Tag.new({
  "name" => "Lunch"
  })

tag1.save()
tag2.save()

transaction1 = Transaction.new({
  'merchant_id' => merchant1.id,
  'transaction_date' => "02/03/2019",
  'value' => 2250,
  'tag_id' => tag1.id
  })

transaction2 = Transaction.new({
    'merchant_id' => merchant2.id,
    'transaction_date' => "03/03/2019",
    'value' => 560,
    'tag_id' => tag2.id
    })

transaction3 = Transaction.new({
      'merchant_id' => merchant1.id,
      'transaction_date' => "04/03/2019",
      'value' => 660,
      'tag_id' => tag2.id
      })

transaction1.save()
transaction2.save()
transaction3.save()

binding.pry
nil
