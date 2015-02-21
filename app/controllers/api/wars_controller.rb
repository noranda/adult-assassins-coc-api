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

    def create
      clan = Clan.find_or_create_by(tag: clan_create_params[:opposing_clan_tag])
      clan.update({ name: clan_create_params[:opposing_clan_name] })

      war = War.new(war_create_params)
      war.opposing_clan = clan
      war.calculate_start_date(war_time_params.to_h.deep_symbolize_keys)

      if war.save
        render json: WarSerializer.new(war).to_json, status: 201
      else
        render json: { errors: true }, status: 422
      end
    end

    private

    def war_create_params
      params.require(:war).permit(:war_size)
    end

    def war_time_params
      params.require(:war).permit(:war_status, :hours, :minutes)
    end

    def clan_create_params
      params.require(:war).permit(:opposing_clan_name, :opposing_clan_tag)
    end
  end
end
