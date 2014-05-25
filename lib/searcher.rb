class Searcher

  SEARCH_SCOPES = [
    FIRST_NAME = "contact_first_name",
    LAST_NAME = "contact_last_name"
  ]

  def search(query:, on:)
    raise "Cannot search on #{on}" unless SEARCH_SCOPES.include?(on)
    Contact.search on.gsub(/contact_/, ''), query
  end

  def multi_search(query:, scopes:)
    invalid_scopes = scopes - SEARCH_SCOPES
    raise "Cannot search on #{invalid_scopes.join(" or ")}" if invalid_scopes.any?
    Contact.search scopes.map{ |scope| scope.gsub(/contact_/, '') }, query
  end
end
