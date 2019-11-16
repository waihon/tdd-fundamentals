# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here
  def full_name
    name = "#{@first_name} #{@middle_name} #{@last_name}"
    remove_extra_spaces(name)
  end

  def full_name_with_middle_initial
    name = "#{@first_name} #{@middle_name && (@middle_name[0] + '.')} #{@last_name}"
    remove_extra_spaces(name)
  end

  def initials
    name = "#{@first_name[0]}#{@middle_name && @middle_name[0]}#{@last_name[0]}"
  end

  private

  def remove_extra_spaces(name)
    name.gsub("  ", " ") # remove extra spaces if middle name is missing
  end
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(first_name: "First", middle_name: "Middle", last_name: "Last")

      expect(person.full_name).to eq("First Middle Last")
    end

    it "does not add extra spaces if middle name is missing" do
      person = Person.new(first_name: "First", last_name: "Last")

      expect(person.full_name).to eq("First Last")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "concatenates first name, middle initial, and last name with spaces" do
      person = Person.new(first_name: "First", middle_name: "Middle", last_name: "Last")

      expect(person.full_name_with_middle_initial).to eq("First M. Last")
    end

    it "does not add extra spaces or a period if middle name is missing" do
      person = Person.new(first_name: "First", last_name: "Last")

      expect(person.full_name_with_middle_initial).to eq("First Last")
    end
  end

  describe "#initials" do
    it "concatenates the initial of first name, middle name, and last name" do
      person = Person.new(first_name: "First", middle_name: "Middle", last_name: "Last")

      expect(person.initials).to eq("FML")
    end

    it "does not add extra spaces if middle name is missing" do
      person = Person.new(first_name: "First", last_name: "Last")

      expect(person.initials).to eq("FL")
    end
  end
end
