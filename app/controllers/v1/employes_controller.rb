class V1::EmployesController < ApplicationController
  def index
    @employes = Employe.all

    render json: @employes, status: :ok
  end

  def create
    @employe = Employe.new(employe_params)

    if @employe.save
      render json: @employe, status: :created
    else
      error_api
    end
  end

  def destroy
    @employe = Employe.where(id: params[:id]).first

    if @employe.destroy
      head(:ok)
    else
      error_api
    end
  end

  private

  def employe_params
    params.require(:employe).permit(:name, :email, :salary)
  end

  def error_api
    head(:unprocessable_entity)
  end
end
