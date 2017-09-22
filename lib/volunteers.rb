class Volunteer

  # attr_reader :id
  attr_accessor :name, :age, :dob, :project_id

  def initialize(attributes)
    # @id = (attributes.key?(:id) ? attributes.fetch(:id) : nil)
    @name = attributes.fetch(:name)
    @age = attributes.fetch(:age)
    @dob = attributes.fetch(:dob)
    @project_id = (attributes.key?(:project_id) ? attributes.fetch(:project_id) : nil)
  end

  def self.volunteers_array(arr)
    volunteers = []
    arr.each() do |volunteer|
      id = volunteer.fetch("id")
      name = volunteer.fetch("name")
      volunteers.push(Volunteer.new({:name => name, :age => age, :dob => dob}))
    end
    volunteers
  end

  def self.all()
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    self.volunteers_array(returned_volunteers)
  end

  def save()
    result =DB.exec("INSERT INTO volunteers (name, age, dob) VALUES ('#{name}', '#{age}', '#{dob}') RETURNING id;")
    @id = result.first().fetch("id")
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name())
  end

  def self.find_volunteer(name)
    volunteer_info = DB.exec("SELECT * FROM volunteers WHERE name = '#{name}';")
    self.volunteers_array(volunteer_info)
  end

  def self.find_volunteer_project(project)
    volunteer_info = DB.exec("SELECT * FROM volunteers WHERE project_id = '#{project_id}';")
    self.volunteers_array(volunteer_info)
  end

  def self.unique_volunteer_list(arr)
    volunteers = []
    arr.each do |volunteer|
      if !volunteers.include?(volunteer.name)
        volunteers.push(volunteer.name)
    end
  end
  volunteers
end



end
