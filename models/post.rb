class Post

  attr_accessor :id, :title, :body

  def save

    conn = Post.open_connection

    if (!self.id)
      sql = "INSERT INTO post (title,body) VALUES ('#{self.title}', #{self.body}')"
    else
      sql="UPDATE post SET title='#{self.title}', body='#{self.body}' WHERE id=#{self.id}"
    end
    conn.exec(sql)
  end

  def self.open_connection

    conn=PG.connect(dbname: "blog")

  end

  def self.all

    conn =self.open_connection

    sql = "SELECT id, title, body, FROM post ORDER BY id"

    results = conn.exec(sql)

    post=results.map do |post|
      self.hydrate(post)
    end
  end

  def self.find(id)

    conn=self.open_connection
    sql="DELETE FROM post WHERE id =#{id}"

    conn.exec(sql)
  end


end
