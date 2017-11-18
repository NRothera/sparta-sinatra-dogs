class Post

  attr_accessor :id, :title, :body, :image

  def save

    conn = Post.open_connection

    if (!self.id)
      sql = "INSERT INTO dogs_rule (title,body,image) VALUES ('#{self.title}', '#{self.body}', '#{self.image}')"
    else
      sql="UPDATE dogs_rule SET title='#{self.title}', body='#{self.body}', image='#{self.image}' WHERE id=#{self.id}"
    end
    conn.exec(sql)
  end

  def self.open_connection

    conn=PG.connect(dbname: "dogs_rule")

  end

  def self.all

    conn =self.open_connection

    sql = "SELECT id, title, body, image FROM dogs_rule ORDER BY id DESC"

    results = conn.exec(sql)

    post=results.map do |post|
      self.hydrate(post)
    end
  end

  def self.find(id)

    conn=self.open_connection
    sql="SELECT * FROM dogs_rule WHERE id=#{id} LIMIT 1"

    dogs = conn.exec(sql)

    dog = self.hydrate(dogs[0])

    dog
  end

  def self.destroy(id)

    conn=self.open_connection

    sql="DELETE FROM dogs_rule WHERE id = #{id}"

    conn.exec(sql)

  end


  def self.hydrate(dog_data)

    dog = Post.new

    dog.id = dog_data['id']
    dog.title = dog_data['title']
    dog.body = dog_data['body']
    dog.image = dog_data['image']

    dog
  end

end
