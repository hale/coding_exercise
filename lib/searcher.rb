class Searcher

  SEARCH_SCOPES = [
    FIRST_NAME = "contact_first_name",
    LAST_NAME = "contact_last_name"
  ]

  def search(query:, on:)
    case on
    when FIRST_NAME then Contact.search_first_name(query)
    when LAST_NAME then Contact.search_last_name(query)
    else raise "Cannot search on #{on}"
    end
  end
end
