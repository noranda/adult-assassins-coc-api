module Api
  class TimersController < ::ApplicationController
    def index
      timers = [Timer.first_active].compact
      render json: ActiveModel::ArraySerializer.new(timers, each_serializer: TimerSerializer, root: :timers).to_json
    end

    def create
      timer = Timer.new
      timer.calculate_end_date(create_params.to_h.deep_symbolize_keys)

      if timer.save
        render json: TimerSerializer.new(timer).to_json, status: 201
      else
        render json: { errors: true }, status: 422
      end
    end

    private

    def create_params
      params.require(:timer).permit(:hours, :minutes)
    end
  end
end
