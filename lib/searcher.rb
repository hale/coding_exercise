class Searcher

  SEARCH_SCOPES = [
    FIRST_NAME = "first_name"
  ]

  def search(query:, on:)
    case on
    when FIRST_NAME then Contact.search_first_name(query)
    else raise "Cannot search on #{on}"
    end
  end
end
