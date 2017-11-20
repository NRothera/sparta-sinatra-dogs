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

    cars
  end

  def self.destroy(id)

    conn=self.open_connection

    sql="DELETE FROM cars WHERE id = #{id}"

    conn.exec(sql)

  end


  def self.hydrate(car_data)

    car = Car.new

    car.id = car_data['id']
    car.title = car_data['title']
    car.body = car_data['body']
    car.image = car_data['image']

    car
  end

end
