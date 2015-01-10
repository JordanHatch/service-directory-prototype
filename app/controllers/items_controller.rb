class ItemsController < ApplicationController
  expose(:service)

  def new
    @item = service.items.new(
      group: params[:group]
    )
  end

  def create
    @item = service.items.new(item_params)

    if item.save
      flash.notice = 'Item created'

      redirect_to service_path(service)
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if item.update_attributes(item_params)
      flash.notice = 'Item saved'

      redirect_to service_path(service)
    else
      render action: :edit
    end
  end

  def destroy
    item.destroy
    flash.notice = 'Item destroyed'

    redirect_to service_path(service)
  end

private
  def item
    @item ||= service.items.find(params[:id])
  end
  helper_method :item

  def group
    item.group_instance
  end
  helper_method :group

  def item_params
    params.require(:item).permit(:name, :group, :parent_id, :primary, :order)
  end
end
