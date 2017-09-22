require 'spec_helper'

describe(Volunteer) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Volunteer.all()).to(eq([]))
    end
  end
end
