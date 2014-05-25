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

  def show
    @contact = Contact.find(params[:id])
  end

  def index
    @contacts = Contact.all
  end

  def autocomplete
    results = searcher.search(on: params[:on], query: params[:query])
    render json: results
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to @contact, notice: "Contact succesfully updated."
    else
      render action: 'edit'
    end
  end

  def search
  end

  def query
    @results = searcher.search(on: params[:on], query: params[:query])
    render :results
  end

  private

  def searcher
    @searcher ||= Searcher.new
  end

  def contact_params
    params.require(:contact).permit([
      :first_name, :last_name,
      { address_attributes: [:id, :line_1, :line_2, :city, :state, :zip_code] },
      { phone_numbers_attributes: [:number, :id] }
    ])
  end
end
