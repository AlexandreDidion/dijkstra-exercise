class Api::V1::CountriesController < Api::V1::BaseController
  def index
    @countries = Country.all
    options_api = {}
    options_api[:meta] = { total: @countries.count }
    json_api = CountrySerializer.new(@countries, options_api).serializable_hash.to_json
    render json: json_api
  end
end
