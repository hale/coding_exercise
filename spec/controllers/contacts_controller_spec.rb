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

  let(:valid_attributes) {
    { first_name: "FirstName", last_name: "LastName", 
      phone_numbers_attributes: [{ number: "123-123-1234" }] }
  }

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

  describe "GET autocomplete" do
    it "conducts a search on a specific form field with the contents of the form" do
      flexmock(Searcher).new_instances.should_receive(:search).with(query: "Katie", on: "contact_first_name").once
      get :autocomplete, { query: "Katie", on: "contact_first_name" }
    end

    it "renders json of the contact, with ID and full name" do
      contact = FactoryGirl.create(:contact, first_name: "Bob", last_name: "Hope")
      flexmock(Searcher).new_instances.should_receive(:search).and_return(contact)
      get :autocomplete
      expect(response.body).to eq({ id: contact.id, full_name: "Bob Hope" }.to_json)
    end
  end

  describe "GET edit" do
    it "assigns the right contact" do
      contact = FactoryGirl.create(:contact, first_name: "Bob", last_name: "Hope")
      get :edit, { id: contact.id }
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "PATCH update" do
    context "with valid attributes" do
      it "updates the contact" do
        contact = FactoryGirl.create(:contact, first_name: "Bob", last_name: "Hope")
        flexmock(Contact).new_instances.should_receive(:update).with({ first_name: "Rob" }).once
        put :update, { id: contact.id, contact: { first_name: "Rob" }}
        expect(assigns(:contact)).to eq(contact)
      end

      it "redirects to contact show" do
        contact = FactoryGirl.create(:contact, first_name: "John", last_name: "Hope")
        put :update, { id: contact.id, contact: { last_name: "Snow" } }
        expect(response).to redirect_to contact
      end
    end

    context "with invalid attributes" do
      it "re-renders the form" do
        contact = FactoryGirl.create(:contact, first_name: "John", last_name: "Hope")
        put :update, { id: contact.id, contact: { last_name: "" } }
        expect(response).to render_template(:edit)
      end
    end
  end
end
