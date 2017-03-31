class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  #Crear un usuario
  #PUT /usuario
  def create
    if params[:id].present?
      message = {'error' => 'No se puede crear usuario con id'}.to_json
      render :json => message, status: :bad_request
    else
      @usuario = User.new(user_params)

      if @usuario.save
        render json: @usuario, status: :created
      else
        message = {'error' => 'La creación ha fallado'}.to_json
        render json: message, status: :internal_server_error
      end
    end
  end

  #Obtener un usuario
  #GET /usuario/id
  def show
    if @usuario != nil
      render json: @usuario, status: :ok
    else
      message = {'error' => 'Usuario no encontrado'}.to_json
      render :json => message, status: :not_found
    end
  end

  #Editar un usuario
  #POST /usuario/id
  def update
    puts '###########################'
    puts request.raw_post

    if @usuario != nil
      if @usuario.update(user_params)
        render json: @usuario, status: :ok
        return
      else
        message = {'error' => 'La modificación ha fallado'}.to_json
        render :json => message, status: :internal_server_error
        return
      end
    else
      message = {'error' => 'Usuario no encontrado'}.to_json
      render :json => message, status: :not_found
      return
    end

    if params[:id] != nil
      message = {'error' => 'id no es modificable'}.to_json
      render :json => message, status: :bad_request
      return
    end
  end

  #Eliminar un usuario
  #DELETE /usuario/id
  def destroy
    if @usuario.nil?
      message = {'error' => 'Usuario no encontrado'}.to_json
      render :json => message, status: :not_found
    else
      @usuario.destroy
      head :no_content
    end
  end

  #Listar todos los usuarios
  #GET /usuario
  def index
    @usuarios = User.all
    message = {'usuarios' => @usuarios, 'total' => @usuarios.count}.to_json
    render json: message, status: :ok
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if User.exists?(id: params[:id])
        @usuario = User.find(params[:id])
      else
        @usuario = nil
      end
    end

    #def user_create_params
    #  params.require(:usuario, :nombre).permit(:apellido, :twitter)
    #end

    def user_params
      params.permit(:id, :usuario, :nombre, :apellido, :twitter)
    end
end
