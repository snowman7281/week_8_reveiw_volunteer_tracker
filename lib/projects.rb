class Project
  attr_reader :id
  attr_accessor :name, :projectinfo

  def initialize(attributes)
    @id = (attributes.key?(:id) ? attributes.fetch(:id) : nil)
    @name = attributes.fetch(:name)
    @projectinfo = attributes.fetch(:projectinfo)
  end

  def self.projects_array(arr)
    projects = []
    arr.each() do |project|
      id = project.fetch("id")
      name = project.fetch("name")
      projectinfo = project.fetch("projectinfo")
      projects.push(Project.new({:id => id, :name => name, :projectinfo => projectinfo}))
    end
    projects
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects;")
    self.projects_array(returned_projects)
  end

  def save()
    result = DB.exec("INSERT INTO projects (name, projectinfo) VALUES ('#{name}', '#{projectinfo}') RETURNING id;")
    @id = result.first().fetch("id")
  end

  def ==(another_project)
    self.name().==(another_project.name()).&(self.projectinfo().==(another_project.projectinfo()))
  end

  def self.find_project(name)
    project_info = DB.exec("SELECT * FROM projects WHERE name = '#{name}';")
    self.projects_array(project_info)
  end
end
