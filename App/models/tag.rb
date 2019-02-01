require_relative( '../db/sql_runner' )

class Tag

  attr_reader( :name, :id)

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

end
