class Student
  
  attr_accessor :name, :grade, :id
  
  def initialize(name, grade, id = nil)
    @id = nil
    @name = name
    @grade = grade 
  end
  
  def self.create_table 
    sql =<<-SQL
    CREATE TABLE IF NOT EXISTS students(
    id INTEGER PRIMARY KEY, 
    name TEXT, 
    grade TEXT
    )
    SQL
  DB[:conn].execute(sql)
end

def save
  sql = <<-SQL
    INSERT INTO students(name, grade)
    VALUES(?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    
    #@id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
  end
end

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
