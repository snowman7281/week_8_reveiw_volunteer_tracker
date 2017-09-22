require 'spec_helper'

describe(Project) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Project.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("will let you save a project into the database") do
      save_test = Project.new({:name => "Snow Vilay", :projectinfo => "Gardening Project"})
      save_test.save()
      project_list = Project.all()
      expect(project_list[0].id).to(eq(save_test.id))
    end
  end

  describe("#find_project") do
    it("will find the project by volunteer") do
      save_test1 = Project.new({:name => "Snow Vilay", :projectinfo => "Gardening Project"})
      save_test1.save()
      save_test2 = Project.new({:name => "Michael Jackson", :projectinfo => "King of Pop"})
      save_test2.save()
      save_test3 = Project.new({:name => "Michael Jordan", :projectinfo => "G.O.A.T."})
      save_test3.save()
      expect(Project.find_project("Michael Jordan")).to(eq([save_test3]))
    end
  end

end
