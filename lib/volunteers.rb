class Volunteer

  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @id = (attributes.key?(:id) ? attributes.fetch(:id) : nil)
    @name = attributes.fetch(:name)
  end

  # def self.voluteers_array(arr)
  #   volunteers = []
  #   arr.each() do |volunteer|
  #     name = volunteer.fetch("name")
  #     volunteers.push(Volunteer.new({:name => name}))
  #   end
  #   volunteers
  # end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name())
  end

  def save()
    DB.exec("INSERT INTO volunteers (name) VALUES ('#{name}');")
  end

  def self.all()
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      volunteers.push(Volunteer.new({:name => name}))
    end
    volunteers
  end

end
