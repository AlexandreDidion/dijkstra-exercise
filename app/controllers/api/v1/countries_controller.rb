class Api::V1::CountriesController < Api::V1::BaseController
  def index
    @countries = Country.all
    json_api = CountrySerializer.new(@countries).serializable_hash.to_json
    render json: json_api
  end
end
