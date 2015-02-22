module Api
  class AttackLogsController < ::ApplicationController
    def create
      attack_log = AttackLog.new(create_params)
      attack_log.time = Time.now

      if attack_log.save
        render json: AttackLogSerializer.new(attack_log).to_json, status: 201
      else
        render json: { errors: true }, status: 422
      end
    end

    private

    def create_params
      params.require(:attack_log).permit(:target_id, :attacker_id, :score)
    end
  end
end
