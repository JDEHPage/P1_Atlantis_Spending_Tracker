require_relative( '../db/sql_runner' )

class Transaction

  attr_reader( :id )
  attr_accessor( :merchant_id, :transaction_date, :value, :tag_id )

  def initialize(options)
    @merchant_id = options['merchant_id']
    @transaction_date = options['transaction_date']
    @value = options['value']
    @tag_id = options['tag_id']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql ="INSERT INTO transactions(
    merchant_id, transaction_date, value, tag_id
    ) VALUES ( $1, $2, $3, $4 ) RETURNING id"
      values = [@merchant_id, @transaction_date,
        @value, @tag_id]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    return transactions.map {|transaction| Transaction.new(transaction)}
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE transactions SET (
    merchant_id, transaction_date, value, tag_id )
     = ($1, $2, $3, $4) WHERE id = $5"
    values = [@merchant_id, @transaction_date, @value, @tag_id, @id]
    SqlRunner.run(sql, values)
  end


end
