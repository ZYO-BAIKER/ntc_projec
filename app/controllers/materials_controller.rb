class MaterialsController < ApplicationController
  before_action :set_material, only: [:edit, :update, :destroy]
  before_action :search_material, only: [:index, :result]

  def index
    @materials = Material.includes(:locations, :repair, :purchase).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @material = Material.new
    3.times { @material.locations.build }
    @material.build_repair
    @material.build_purchase
  end

  def create
    @material = Material.new(material_params)
    if @material.valid?
      clear_other_users_if_not_selected
      @material.save!
      redirect_to materials_path
    else
      render :new
    end
  end

  def edit
    (3 - @material.locations.size).times { @material.locations.build }
    @material.repair ||= @material.build_repair
    @material.purchase ||= @material.build_purchase
  end

  def update
    if @material.update(material_params)
      clear_other_users_if_not_selected
      if @material.save
        redirect_to materials_path
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    @material.destroy!
    redirect_to materials_path
  end

  def result
    @materials = @q.result.order("created_at DESC").page(params[:page]).per(10)
  end

  private

    def material_params
      params.require(:material).permit(
        :material_name, :maker, :all_count, :company_count, :memo,
        locations_attributes: [
          :id, :place, :location_user, :location_other_user, :usage_count, :period_start, :period_end, :_destroy
        ],
        repair_attributes: [:repair_request, :repair_count, :inspection_date, :inspection_content],
        purchase_attributes: [:purchase_date, :purchase_price, :purchase_place]
      )
    end

    def set_material
      @material = Material.find(params[:id])
    end

    def search_material
      @q = Material.ransack(params[:q])
    end

    def clear_other_users_if_not_selected
      @material.locations.each do |location|
        if location.location_user != "その他"
          location.location_other_user = ""
        end
      end
    end
end
