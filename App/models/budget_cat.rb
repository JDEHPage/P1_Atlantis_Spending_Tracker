require_relative( '../db/sql_runner' )

class Budget

  attr_reader( :id )
  attr_accessor(:tag_id, :amount )

  def initialize(options)
    @tag_id = options['tag_id'].to_i
    @amount = options['amount']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql ="INSERT INTO budget_categories (tag_id,
    amount
    ) VALUES ( $1, $2 ) RETURNING id"
    values = [@tag_id, (@amount.to_f * 100).to_i]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM budget_categories"
    budget_categorie = SqlRunner.run(sql)
    return budget_categorie.map {|budget_categorie| Budget.new(budget_categorie)}
  end

  def self.delete(id)
    sql = "DELETE FROM budget_categories WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE budget_categories SET (
    amount )
    = ($1, $2) WHERE id = $3"
    values = [@tag_id, (@amount.to_f * 100).to_i, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM budget_categories
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    budget = Budget.new(result)
    return budget
  end

  def self.total_budget()
    sql = "SELECT SUM(amount)
    FROM budget_categories;"
    result = SqlRunner.run(sql).first["sum"].to_f/100
    return result.to_f
  end

  def b_tag()
    tag = Tag.find(@tag_id)
    return tag
  end

end
