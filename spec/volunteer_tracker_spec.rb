require 'spec_helper'


describe('#volunteer_tracker') do
  describe('#==') do
    it('will check if it is the same name if it has the same name') do
      volunteer_test1 = Volunteer.new({:name => "Snow Vilay"})
      volunteer_test2 = Volunteer.new({:name => "Snow Vilay"})
      expect(volunteer_test1).to(eq(volunteer_test2))
    end

    describe('.all') do
      it('is empty at first') do
        expect(Volunteer.all()).to(eq([]))
      end
    end
  end
end

describe Volunteer do
  describe("#save") do
end
