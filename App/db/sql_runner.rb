require( 'pg')

class SqlRunner

  def self.run ( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd3k9mhguj66210', host: 'ec2-184-72-238-22.compute-1.amazonaws.com',
        port: 5432, user: 'xazlqdiqqwuedp', password: '5a2db9625b327475c6ec5de70cad6191f38d8a4f62b217be39b591529e7e065e'})
      db.prepare("query", sql)
      result = db.exec_prepared("query",values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end




# require( 'pg')
#
# class SqlRunner
#
#   def self.run ( sql, values = [] )
#     begin
#       db = PG.connect({ dbname: 'atlantis', host: 'localhost' })
#       db.prepare("query", sql)
#       result = db.exec_prepared("query",values)
#     ensure
#       db.close() if db != nil
#     end
#     return result
#   end
#
# end
