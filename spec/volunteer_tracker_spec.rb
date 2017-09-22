require 'spec_helper'


describe('#volunteer_tracker') do
  describe('checking volunteers class') do
    it('will create a volunteer class') do
      volunteer_test = Volunteer.new({:name => "Snow Vilay",})
      expect(volunteer_test.name()).to(eq("Snow Vilay"))
    end
  end
end
