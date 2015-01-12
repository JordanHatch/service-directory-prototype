class ServicesController < ApplicationController
  expose(:services)
  expose(:service, attributes: :service_params)

  def index
  end

  def create
    if service.save
      redirect_to service_path(service)
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if service.update_attributes(service_params)
      flash.notice = 'Service saved'
      redirect_to service_path(service)
    else
      render action: :edit
    end
  end

private
  def groups
    Group.all
  end
  helper_method :groups

  def service_params
    params.require(:service).permit(:name)
  end
end
