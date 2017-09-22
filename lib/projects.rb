class Project

  attr_reader :id
  attr_accessor :name, :projectINFO, :volunteer

  def initialize(attributes)
    @id = (attributes.key?(:id) ? attributes.fetch(:id) : nil)
    @name = attributes.fetch(:name)
    @projectINFO = attributes.fetch(:projectINFO)
    @volunteer = (attributes.key?(:volunteer) ? attributes.fetch(:volunteer) : nil)
  end

  def save()
    result = DB.exec("INSERT INTO project (name, projectINFO) VALUES ('#{name}', '#{projectINFO}') RETURNING id;")
    @id = result.first().fetch("id")
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM project;")
    projects = []
    arr.each() do |project|
      id = project.fetch("id")
      name = project.fetch("name")
      projectINFO = volunteer.fetch("projectINFO")
      volunteer = volunteer.fetch("volunteer")
      volunteers.push(Volunteer.new({:id => id, :name => name, :projectINFO => projectINFO, :volunteer => volunteer}))
    end
    projects
  end

end
