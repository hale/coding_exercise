class Searcher

  SEARCH_SCOPES = [
    FIRST_NAME = "contact_first_name",
    LAST_NAME = "contact_last_name"
  ]

  def search(query:, on:)
    raise "Cannot search on #{on}" unless SEARCH_SCOPES.include?(on)
    Contact.search on.gsub(/contact_/, ''), query
  end
end
