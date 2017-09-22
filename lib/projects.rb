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

  def self.unique_volunteer_list(arr)
    projects = []
    arr.each do |project|
      if !projects.include?(project.name)
        projects.push(project.name)
    end
  end
  projects
end

  def self.edit_info(attributes)
    new_name = attributes.fetch(:new_name)
    new_projectinfo = attributes.fetch(:new_projectinfo)
    name = attributes.fetch(:name)
    projectinfo = attributes.fetch(:projectinfo)
    DB.exec("UPDATE projects SET name = '#{new_name}', projectinfo = '#{new_projectinfo}' WHERE name = '#{name}' AND projectinfo = '#{projectinfo}';")
  end

  def self.delete_info(attributes)
    name = attributes.fetch(:name)
    projectinfo = attributes.fetch(:projectinfo)
    DB.exec("DELETE FROM projects WHERE name = '#{name} AND projectinfo = '#{projectinfo}'")
  end

end
