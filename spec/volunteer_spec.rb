require 'spec_helper'

describe(Volunteer) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("will let you save a volunteer into the database") do
      save_test = Volunteer.new({:name => "Snow Vilay"})
      save_test.save()
      volunteer_list = Volunteer.all()
      expect(volunteer_list[0].id).to(eq(save_test.id))
    end
  end

  describe("#find_volunteer") do
    it("will find the volunteer by project") do
      save_test1 = Volunteer.new({:name => "Snow Vilay"})
      save_test1.save()
      save_test2 = Volunteer.new({:name => "Michael Jackson"})
      save_test2.save()
      save_test3 = Volunteer.new({:name => "Michael Jordan"})
      save_test3.save()
      expect(Volunteer.find_volunteer("Michael Jordan")).to(eq([save_test3]))
    end
  end

  describe("#==") do
    it("is the same name if it has the same name") do
      name1 = Volunteer.new({:name => "Snow Vilay"})
      name2 = Volunteer.new({:name => "Snow Vilay"})
      expect(name1).to(eq(name2))
    end
  end

end
