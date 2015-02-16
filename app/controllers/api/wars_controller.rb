module Api
  class WarsController < ::ApplicationController
    def index
      wars = War.all
      render json: ActiveModel::ArraySerializer.new(wars, each_serializer: WarSerializer, root: :wars).to_json
    end

    def show
      war = War.find(params[:id])
      render json: WarSerializer.new(war).to_json
    end
  end
end
