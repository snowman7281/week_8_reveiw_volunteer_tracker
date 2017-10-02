require "spec_helper"

describe Project do
  describe '#title' do
    it 'returns the project title' do
      project = Project.new({:title => 'Winter Project', :id => nil})
      expect(project.title).to eq 'Winter Project'
    end
  end

  context '#id' do
    it 'returns the id of the project before saving project' do
      project = Project.new({:title => 'Winter Project', :id => nil})
      expect(project.id).to eq nil
    end
  end

  describe '#==' do
    it 'is the same project if two projects have the same title' do
      project1 = Project.new({:title => 'Winter Project', :id => nil})
      project2 = Project.new({:title => 'Winter Project', :id => nil})
      expect(project1 == project2).to eq true
    end
  end

  context '.all' do
    it 'is empty to start' do
      expect(Project.all).to eq []
    end

    it 'returns all projects' do
      project1 = Project.new({:title => 'Winter Project', :id => nil})
      project1.save
      project2 = Project.new({:title => 'Winter Project', :id => nil})
      project2.save
      expect(Project.all).to eq [project1, project2]
    end
  end

  describe '#save' do
    it 'saves a project to the database' do
      project = Project.new({:title => 'Winter Project', :id => nil})
      project.save
      expect(Project.all).to eq [project]
    end
  end

  describe '.find' do
    it 'returns a project by id' do
      project1 = Project.new({:title => 'Winter Project', :id => nil})
      project1.save
      project2 = Project.new({:title => 'Winter Project', :id => nil})
      project2.save
      expect(Project.find(project1.id)).to eq project1
    end
  end

  describe '#volunteers' do
    it 'returns all volunteers for a specific project' do
      project = Project.new({:title => 'Winter Project', :id => nil})
      project.save
      volunteer1 = Volunteer.new({:name => 'Snow Vilay', :project_id => project.id, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Michael Jordan', :project_id => project.id, :id => nil})
      volunteer2.save
      expect(project.volunteers).to eq [volunteer1, volunteer2]
    end
  end

  describe '#update' do
    it 'allows a user to update a project' do
      project = Project.new({:title => 'Winter Project', :id => nil})
      project.save
      project.update({:title => 'Summer Project', :id => nil})
      expect(project.title).to eq 'Summer Project'
    end
  end

  context '#delete' do
    it 'allows a user to delete a project' do
      project = Project.new({:title => 'Winter Project', :id => nil})
      project.save
      project.delete
      expect(Project.all).to eq []
    end
  end
end
