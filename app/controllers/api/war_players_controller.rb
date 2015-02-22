module Api
  class WarPlayersController < ::ApplicationController
    def create
      war_player = WarPlayer.new(create_params)
      if war_player.save
        render json: WarPlayerSerializer.new(war_player).to_json, status: 201
      else
        render json: { errors: true }, status: 422
      end
    end

    private

    def create_params
      params.require(:war_player).permit(:friendly, :player_id, :position, :war_id)
    end
  end
end
