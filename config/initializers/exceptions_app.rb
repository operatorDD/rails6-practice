Rails.application.configure do
  config.exceptions_app = ->(env) do
    request = ActionDispatch::Request.new(env)

    action = if request.path_info == '/404' 
               :not_found
             elsif request.path_info == '/422'
               :unprocessable_entity
             else
               :internal_server_error
             end
    ErrorsController.action(action).call(env)
  end
end
