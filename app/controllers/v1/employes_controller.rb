class V1::EmployesController < ApplicationController
  before_action :set_employe, only: [:show, :update, :destroy]

  def index
    @employes = Employe.all

    render json: @employes, status: :ok
  end

  def show
    render json: @employ, status: :ok
  end

  def create
    @employe = Employe.new(employe_params)

    if @employe.save
      render json: @employe, status: :created
    else
      error_api
    end
  end

  def update
    if @employe.update(employe_params)
      head(:ok)
    else
      head(:not_found)
    end
  end

  def destroy
    if @employe.destroy
      head(:ok)
    else
      head(:not_found)
    end
  end

  private

  def employe_params
    params.permit(:name, :email, :salary)
  end

  def set_employe
    @employe = Employe.find(params[:id])
  end

  def error_api
    head(:unprocessable_entity)
  end
end
