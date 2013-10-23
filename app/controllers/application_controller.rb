class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  serialization_scope :view_context


  protected
  def set_pagination(name, options = {})
    scope = instance_variable_get("@#{name}")
    # logger.debug("scope: #{scope}")
    request_params = request.query_parameters
    # logger.debug("request_params: #{request_params}")
    url_without_params = request.original_url.slice(0..(request.original_url.index("?")-1)) unless request_params.empty?
    # logger.debug("url_without_params: #{url_without_params}")
    url_without_params ||= request.original_url
    # logger.debug("url_without_params: #{url_without_params}")
    
    page = {}
    page[:first] = 1 if scope.total_pages > 1 && !scope.first_page?
    page[:last] = scope.total_pages  if scope.total_pages > 1 && !scope.last_page?
    page[:next] = scope.current_page + 1 unless scope.last_page?
    page[:prev] = scope.current_page - 1 unless scope.first_page?

    # logger.debug("page: #{page}")
    
    pagination_links = []
    page.each do |k,v|
      new_request_hash= request_params.merge({:page => v})
      pagination_links << "<#{url_without_params}?#{new_request_hash.to_param}>;rel=\"#{k}\">"
    end

    response.headers["Links"] = pagination_links.join(",")
  end
end
