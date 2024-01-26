class ErrorsController < ActionController::Base
  def not_found
    render :json => {:error => "not-found"}.to_json, :status => 404
  end

  def exception
    render :text => "500 Internal Server Error", :status => 500 # You can render your own template here
  end
end
