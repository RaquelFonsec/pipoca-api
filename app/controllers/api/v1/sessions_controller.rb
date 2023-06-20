class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:create, :authenticate_user]

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      user.generate_authentication_token! # Gera um novo token de autenticação para o usuário
      user.save
      render json: { token: user.authentication_token }
    else
      render json: { error: 'Credenciais inválidas' }, status: :unauthorized
    end
  end

  def authenticate_user
    user = User.find_by(email: request.headers['X-User-Email'])

    if user&.valid_token?(request.headers['X-User-Token'])
      # Usuário autenticado com sucesso
    else
      render json: { error: 'Falha na autenticação do usuário' }, status: :unauthorized
    end
  end
end
