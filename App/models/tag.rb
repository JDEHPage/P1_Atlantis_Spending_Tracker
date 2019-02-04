require_relative( '../db/sql_runner' )

class Tag

  attr_reader( :id )
  attr_accessor( :name )

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql ="INSERT INTO tags(
    name
    ) VALUES (
      $1
      ) RETURNING id"
      values = [@name]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tags"
    tags = SqlRunner.run(sql)
    return tags.map {|tag| Tag.new(tag)}
  end

  def self.delete(id)
    sql = "DELETE FROM tags WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE tags SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    tag = Tag.new(result)
    return tag
  end


  # def self.total()
  #   sql = "SELECT SUM(value)
  #   FROM transactions;"
  #   result = SqlRunner.run(sql).first["sum"].to_f/100
  #   return result.to_s
  # end

  def total()
    sql = "SELECT SUM(value)
    FROM transactions WHERE tag_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values).first["sum"].to_f/100
    return result.to_s
  end

# def transactions()
#   sql = "SELECT * FROM transactions WHERE tag_id = $1"
#   values = [@id]
#   transactions = SqlRunner.run(sql, values)
#   return transactions.map { |transaction| Transaction.new(transaction)}
# end

# def total_for_tag
#   total = 0
#   transactions = transactions()
#   transaction.each { |transaction| total += transaction.value}
# end







end
