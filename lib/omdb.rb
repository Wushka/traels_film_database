

module Omdb
  class Api
    #i don't like to put api-keys in open repositories
    API_KEY = Rails.application.credentials.omdb.api_key.freeze
    BASE_URL = "https://www.omdbapi.com/".freeze

    def self.get(params)
      get_params = {apikey: API_KEY}.merge(params)
      #TODO httpstatus handling
      response = HTTP.get(BASE_URL, params: get_params).parse
    end

    def self.search_movies(query_string)
      formatted_query_string = query_string.split.join("+")
      get({s: formatted_query_string})
    end

    def self.movie_details(imdb_id)
      get({i: imdb_id})
    end
  end
end
