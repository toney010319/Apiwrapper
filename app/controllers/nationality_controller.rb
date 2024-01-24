class NationalityController < ActionController::API
    def nationality
        name = params[:name]

        if name.blank?
          render json: { error: 'Name parameter is required' }, status: :bad_request
          return
        end
      nationality_api = NationalityApi.new(name)
      result = nationality_api.fetch_nationality
      if result.key?(:error)
        render json: { error: result[:error] }, status: :bad_request
      else
        render json: result
      end
    end
  end