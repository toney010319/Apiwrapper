class GenderController < ActionController::API
    def gender
        name = params[:name]

        if name.blank?
          render json: { error: 'Name parameter is required' }, status: :bad_request
          return
        end
      gender_api = GenderApi.new(name)
      result = gender_api.fetch_gender
      if result.key?(:error)
        render json: { error: result[:error] }, status: :bad_request
      else
        render json: result
      end
    end
  end