class Searcher

  SEARCH_SCOPES = [
    FIRST_NAME = "contact_first_name",
    LAST_NAME = "contact_last_name",
    ADDRESS_LINE_1 = "address_line_1"
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
      model, field = scope.split("_", 2)
      if model == 'contact'
        results << (Contact.search field, query)
      else
        model_results = model.capitalize.constantize.search field, query
        results << model_results.map(&:contact)
      end
    end
    results.flatten
  end
end
