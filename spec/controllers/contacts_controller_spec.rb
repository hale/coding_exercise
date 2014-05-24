require 'spec_helper'

describe ContactsController, :type => :controller do
  it "/contacts/new should be OK" do
    get :new
    expect(response).to be_successful
  end

end
