class Project
  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id) || nil
  end

  def title
    @title
  end

  def id
    @id
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def self.find(id)
   found_project = nil
   Project.all().each() do |project|
     if project.id().==(id)
       found_project = project
     end
   end
   found_project
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def volunteers
    volunteers = []
    results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id};")
    results.each do |result|
      name = result.fetch("name")
      project_id = result.fetch("project_id").to_i
      id = result.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def ==(another_project)
    self.title == another_project.title && self.id == another_project.id
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    @id = self.id()
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
   DB.exec("DELETE FROM projects WHERE id = #{self.id()};")
  end

end
