require 'spec_helper'

describe Searcher do

  let(:searcher) { Searcher.new }

  it "matches a contact given a first name" do
    contact = FactoryGirl.create(:contact, first_name: "John")
    results = searcher.search(query: "John", on: "first_name")
    expect(results).to eq([contact])
  end

  it "when specifying first name does not include last name in search" do
    FactoryGirl.create(:contact, first_name: "John", last_name: "Baptist")
    results = searcher.search(query: "Baptist", on: "first_name")
    expect(results).to be_empty
  end
end
