class MaterialsController < ApplicationController
  before_action :set_material, only: [:edit, :update, :destroy]
  before_action :search_material, only: [:index, :result]  # 検索オブジェクトを生成

  def index
    @materials = Material.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.valid?
      binding.pry
      if @material.place == "車庫"
        @material.other_places = ""
        @material.user == "車庫"
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
      if @material.place == "車庫" #場所が「車庫」なら、「現場」の値を消去して、使用者は車庫になる
        @material.other_places = ""
        @material.user = "車庫"
      end
      if @material.user != "その他" #使用者が「その他」でないなら、「その他」の値を消去
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
    @materials = @q.result.order("created_at DESC").page(params[:page]).per(10)
  end

  private

    def material_params
      params.require(:material).permit(:name, :maker, :place, :other_places, :user, :other_users, :period_start, :period_end,
                                       :purchase_date, :price, :inspection_date, :memo)
    end

    def set_material
      @material = Material.find(params[:id])
    end

    def search_material
      @q = Material.ransack(params[:q])
    end
end
