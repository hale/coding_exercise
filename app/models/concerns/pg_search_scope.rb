module PgSearchScope
  extend ActiveSupport::Concern

  included do
    pg_search_scope :search, lambda { |on, query|
      {
        against: on,
        query: query,
        using: {
          trigram: {
            threshold: 0.2
          }
        }
      }
    }
  end
end
