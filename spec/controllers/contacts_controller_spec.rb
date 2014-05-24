require 'spec_helper'

describe ContactsController, :type => :controller do
  describe "#new"
  it "should be OK" do
    get :new
    expect(response).to be_successful
  end

  it "should assign new contact" do
    get :new
    expect(assigns(:contact)).to_not be_nil
  end

end
