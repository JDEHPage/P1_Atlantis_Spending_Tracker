require_relative( '../db/sql_runner' )

class Merchant

  attr_reader( :id )
  attr_accessor( :name )

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  # def initialize(options = {})
  #   @name = options['name'] || ''
  #   @id = options['id'].to_i if options['id']
  # end

  def save
    sql ="INSERT INTO merchants(
    name
    ) VALUES (
      $1
      ) RETURNING id"
      values = [@name]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def self.all
      sql = "SELECT * FROM merchants"
      merchants = SqlRunner.run(sql)
      return merchants.map {|merchant| Merchant.new(merchant)}
    end

    # def delete()
    #   sql = "DELETE FROM merchants WHERE id = $1"
    #   values = [@id]
    #   SqlRunner.run(sql, values)
    # end

    def self.delete(id)
      sql = "DELETE FROM merchants WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
    end

    def update()
      sql = "UPDATE merchants SET
      name = $1 WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    def self.find( id )
      sql = "SELECT * FROM merchants
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql ,values).first
      merchant = Merchant.new(result)
      return merchant
    end







  end
