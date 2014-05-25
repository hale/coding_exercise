require 'spec_helper'

describe Searcher do

  let(:searcher) { Searcher.new }

  it "matches a contact given a first name" do
    contact = FactoryGirl.create(:contact, first_name: "John")
    results = searcher.search(query: "John", on: "contact_first_name")
    expect(results).to eq([contact])
  end

  it "when specifying first name does not include last name in search" do
    FactoryGirl.create(:contact, first_name: "John", last_name: "Baptist")
    results = searcher.search(query: "Baptist", on: "contact_first_name")
    expect(results).to be_empty
  end

  it "can search on last_name" do
    expect {
      searcher.search(query: "tst", on: "contact_last_name")
    }.to_not raise_error
  end

  it "raises an exception when searching on invalid scope" do
    expect {
      searcher.search(query: "tst", on: "nevergoingtobeascope")
    }.to raise_error
  end

  describe "partial matches" do
    it "matches a contact with only first few letters of their name" do
      contact = FactoryGirl.create(:contact, first_name: "Jason")
      expect(searcher.search(query: "ja", on: "contact_first_name")).to eq([contact])
    end
  end

  describe "multi_search" do
    it "searches on multiple fields" do
      c1 = FactoryGirl.create(:contact, first_name: "Adam")
      c2 = FactoryGirl.create(:contact, last_name: "Jones")
      results = searcher.multi_search(
        query: "Adam Jones",
        scopes: ["contact_first_name", "contact_last_name"]
      )
      expect(results).to eq([c1,c2])
    end

    it "errors when provided with an invalid scope" do
      expect{
        searcher.multi_search(query: "tst", scopes: ["notascopeever"])
      }.to raise_error
    end

  end
end
