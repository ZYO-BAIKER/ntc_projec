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
      if @material.place != "現場" # 場所が「現場」でないなら、「現場」の値を消去
        @material.other_places = ""
      end
      if @material.place != "修理中" # 場所が「修理中」でないなら、「修理中」の値を消去
        @material.repair_request = ""
      end
      if @material.user != "その他" # 使用者が「その他」でないなら、「その他」の値を消去
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
      if @material.place != "現場" # 場所が「現場」でないなら、「現場」の値を消去
        @material.other_places = ""
      end
      if @material.place != "修理中" # 場所が「修理中」でないなら、「修理中」の値を消去
        @material.repair_request = ""
      end
      if @material.user != "その他" # 使用者が「その他」でないなら、「その他」の値を消去
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
      params.require(:material).permit(:material_name, :material_count, :maker, :place, :place_2, :place_3,
                                       :other_places, :other_places_2, :other_places_3, :repair_request, :repair_request_2, :repair_request_3,
                                       :user, :user_2, :user_3, :other_users, :other_users_2, :other_users_3, :use_count, :use_count_2, :use_count_3,
                                       :period_start, :period_end, :period_start_2, :period_end_2, :period_start_3, :period_end_3,
                                       :purchase_date, :purchase_price, :purchase_place, :inspection_date, :inspection_content, :memo)
    end

    def set_material
      @material = Material.find(params[:id])
    end

    def search_material
      @q = Material.ransack(params[:q])
    end
end
