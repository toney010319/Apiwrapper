class AgeController < ActionController::API
    def age
        name = params[:name]

        if name.blank?
          render json: { error: 'Name parameter is required' }, status: :bad_request
          return
        end
      age_api = AgeApi.new(name)
      result = age_api.fetch_age
      if result.key?(:error)
        render json: { error: result[:error] }, status: :bad_request
      else
        render json: result
      end
    end
  end