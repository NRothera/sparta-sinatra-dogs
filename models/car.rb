class Car

  attr_accessor :id, :title, :body, :image

  def save

    conn = Car.open_connection

    if (!self.id)
      sql = "INSERT INTO cars (title,body,image) VALUES ('#{self.title}', '#{self.body}', '#{self.image}')"
    else
      sql="UPDATE cars SET title='#{self.title}', body='#{self.body}', image='#{self.image}' WHERE id=#{self.id}"
    end
    conn.exec(sql)
  end

  def self.api_create(car)

    conn = self.open_connection

    sql = "INSERT INTO cars (title, body, image) VALUES ( '#{cars[:title]}', '#{cars[:body]}', '#{cars[:image]}')"

    conn.exec(sql)
  end

  def self.api_update(car)

    conn = self.open_connection

    sql = "UPDATE cars SET title='#{cars[:title]}', body='#{cars[:body]}', image='#{cars[:image]}', WHERE id=#{cars[:id]}"

    conn.exec(sql)

  end



  def self.open_connection

    conn=PG.connect(dbname: "cars")

  end

  def self.all

    conn =self.open_connection

    sql = "SELECT id, title, body, image FROM cars ORDER BY id DESC"

    results = conn.exec(sql)

    car=results.map do |cars|
      self.hydrate(cars)
    end
  end

  def self.find(id)

    conn=self.open_connection
    sql="SELECT * FROM cars WHERE id=#{id} LIMIT 1"

    cars = conn.exec(sql)

    car = self.hydrate(cars[0])

    car
  end

  def self.apiFind(id)

    conn = self.open_connection

    sql = "SELECT * FROM cars WHERE id = #{id} LIMIT 1"

    cars = conn.exec(sql)

    cars[0]

  end

  def self.destroy(id)

    conn=self.open_connection

    sql="DELETE FROM cars WHERE id = #{id}"

    conn.exec(sql)

  end


  def self.hydrate(car_data)

    cars = Car.new

    cars.id = car_data['id']
    cars.title = car_data['title']
    cars.body = car_data['body']
    cars.image = car_data['image']

    cars
  end

end
