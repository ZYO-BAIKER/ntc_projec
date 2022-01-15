class MaterialsController < ApplicationController
  before_action :set_material, only: [:edit, :update, :destroy]
  before_action :search_material, only: [:index, :result]  # 検索オブジェクトを生成

  def index
    @materials = Material.all.order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.valid?
      @material.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @@request_referer = request.referer
  end

  def update
    if @material.update(material_params)
      @material.save!
      redirect_to @@request_referer
    else
      render :edit
    end
  end

  def destroy
    @material.destroy!
    redirect_to @@request_referer
  end

  def result
    @results = @q.result.order("created_at DESC").page(params[:page]).per(20)
  end

  private

    def material_params
      params.require(:material).permit(:name, :maker, :place, :user, :period, :purchase_date, :price, :inspection_date, :memo)
    end

    def set_material
      @material = Material.find(params[:id])
    end

    def search_material
      @q = Material.ransack(params[:q])
    end
end
