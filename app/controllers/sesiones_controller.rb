class SesionesController < ApplicationController
  respond_to :json

  def create
    if Usuario.authenticate(params[:email], params[:password])
      @usuario = Usuario.find_by_email(params[:email])
      render json: @usuario#, each_serializer: UsuarioSerializer
    else
      render :nothing => true, :status => 401
    end

  end

end
