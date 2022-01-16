class MaterialsController < ApplicationController
  before_action :set_material, only: [:edit, :update, :destroy]
  before_action :search_material, only: [:index, :result]  # 検索オブジェクトを生成

  def index
    @materials = Material.all.order("created_at DESC").page(params[:page]).per(10)
    @materials_count = Material.all.count
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.valid?
      if @material.place == "車庫"
        @material.other_places = ""
      end
      if @material.user != "その他"
        @material.other_users = ""
      end
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
      if @material.place == "車庫"
        @material.other_places = ""
      end
      if @material.user != "その他"
        @material.other_users = ""
      end
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
    @results = @q.result.order("created_at DESC").page(params[:page]).per(10)
    @results_count = @q.result.count
  end

  private

    def material_params
      params.require(:material).permit(:name, :maker, :place, :other_places, :user, :other_users, :period, :purchase_date, :price, :inspection_date, :memo)
    end

    def set_material
      @material = Material.find(params[:id])
    end

    def search_material
      @q = Material.ransack(params[:q])
    end
end
