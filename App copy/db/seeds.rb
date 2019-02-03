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

merchant3 = Merchant.new({
  "name" => "Marks & Spencer"
  })

merchant4 = Merchant.new({
  "name" => "TK Max"
  })

merchant5 = Merchant.new({
  "name" => "Mc Donalds"
  })

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()
merchant5.save()


tag1 = Tag.new({
  "name" => "Groceries"
  })

tag2 = Tag.new({
  "name" => "Lunch"
   })

tag3 = Tag.new({
  "name" => "Snack"
   })

tag4 = Tag.new({
  "name" => "Clothing"
  })

tag5 = Tag.new({
  "name" => "Gifts"
  })

tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()



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

transaction4 = Transaction.new({
  'merchant_id' => merchant3.id,
  'transaction_date' => "04/03/2019",
  'value' => 1500,
  'tag_id' => tag5.id
  })

transaction5 = Transaction.new({
  'merchant_id' => merchant4.id,
  'transaction_date' => "06/03/2019",
  'value' => 1560,
  'tag_id' => tag4.id
  })

transaction6 = Transaction.new({
  'merchant_id' => merchant5.id,
  'transaction_date' => "09/03/2019",
  'value' => 560,
  'tag_id' => tag3.id
  })



transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()
transaction6.save()

binding.pry
nil
