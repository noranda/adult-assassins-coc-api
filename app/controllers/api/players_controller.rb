module Api
  class PlayersController < ::ApplicationController
    def create
      player = Player.new(player_params)
      if player.save
        render json: PlayerSerializer.new(player).to_json, status: 201
      else
        render json: { errors: true }, status: 422
      end
    end

    def update
      player = Player.find(params[:id])
      if player.update(player_params)
        render json: PlayerSerializer.new(player).to_json
      else
        render json: { errors: true }, status: 422
      end
    end

    private

    def player_params
      params.require(:player).permit(:name)
    end
  end
end
