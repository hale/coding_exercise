class Searcher

  SEARCH_SCOPES = [
    FIRST_NAME = "contact_first_name",
    LAST_NAME = "contact_last_name",
    ADDRESS_LINE_1 = "address_line_1",
    ADDRESS_LINE_2 = "address_line_2",
    ADDRESS_CITY = "address_city",
    ADDRESS_STATE = "address_state",
    ADDRESS_ZIP_CODE = "address_zip_code",
    PHONE_NUMBER_NUMBER = "phone_number_number"
  ]

  SEARCH_MODELS = [
    CONTACT = /contact_/,
    ADDRESS = /address_/,
    PHONE_NUMBER = /phone_number_/
  ]

  def search(query:, on:)
    raise "Cannot search on #{on}" unless SEARCH_SCOPES.include?(on)
    Contact.search on.gsub(/contact_/, ''), query
  end

  def multi_search(query:, scopes:)
    invalid_scopes = scopes - SEARCH_SCOPES
    raise "Cannot search on #{invalid_scopes.join(" or ")}" if invalid_scopes.any?

    results = []
    scopes.each do |scope|
      if CONTACT.match(scope)
        results << (Contact.search scope.gsub(CONTACT, ''), query)
      elsif ADDRESS.match(scope)
        model_results = Address.search scope.gsub(ADDRESS, ''), query
        results << model_results.map(&:contact)
      elsif PHONE_NUMBER.match(scope)
        model_results = PhoneNumber.search scope.gsub(PHONE_NUMBER, ''), query
        results << model_results.map(&:contact)
      end
    end
    results.flatten.uniq
  end
end
