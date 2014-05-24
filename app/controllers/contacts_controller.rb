class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact, notice: "Contact successfully created"
    else
      render action: 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit([
      :first_name, :last_name,
      { address_attributes: [:line_1, :line_2, :city, :state, :zip_code] },
      { phone_numbers_attributes: :number }
    ])
  end
end
