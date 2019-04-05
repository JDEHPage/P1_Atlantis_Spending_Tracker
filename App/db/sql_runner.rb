require( 'pg')

class SqlRunner

  def self.run ( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'darhpefscpb3mp', host: 'ec2-75-101-131-79.compute-1.amazonaws.com',
        port: 5432, user: 'vmttxawkibqrmx', password: 'e0ab51bf1419b18178dc0a69a3c8f5426714a4ab2ba0908cd1967f5835920bf8D'})
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
