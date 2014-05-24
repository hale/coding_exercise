require 'spec_helper'

describe ContactsController, :type => :controller do
  describe "#new" do
    it "should be OK" do
      get :new
      expect(response).to be_successful
    end

    it "should assign new contact" do
      get :new
      expect(assigns(:contact)).to_not be_nil
    end
  end

  let(:valid_attributes) { { first_name: "FirstName", last_name: "LastName" } }

  describe "POST create" do
    it "with valid params creates a new contact" do
      expect {
        post :create, { contact: valid_attributes }
      }.to change(Contact, :count).by(1)
    end
  end

  describe "GET show" do
    before(:each) {
      @contact = FactoryGirl.create(:contact)
      get :show, { id: @contact.id }
    }

    it "assigns the contact" do
      expect(assigns(:contact)).to eq(@contact)
    end
  end
end
