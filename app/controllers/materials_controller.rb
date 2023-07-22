class MaterialsController < ApplicationController
  before_action :set_material, only: [:edit, :update, :destroy]
  before_action :search_material, only: [:index, :result]

  def index
    @materials = Material.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    other_users
    if @material.valid?
      @material.save!
      redirect_to materials_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @material.update(material_params)
      other_users
      @material.save!
      redirect_to materials_path
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
      params.require(:material).permit(:material_name, :maker, :all_count, :company_count, :place, :place2, :place3,
                                       :user, :user2, :user3, :other_users, :other_users2, :other_users3, :use_count, :use_count2, :use_count3,
                                       :period_start, :period_end, :period_start2, :period_end2, :period_start3, :period_end3, :repair_request, :repair_count,
                                       :purchase_date, :purchase_price, :purchase_place, :inspection_date, :inspection_content, :memo)
    end

    def set_material
      @material = Material.find(params[:id])
    end

    def search_material
      @q = Material.ransack(params[:q])
    end

    def other_users
      if @material.user != "その他" # 使用者が「その他」でないなら、「その他」の値を消去
        @material.other_users = ""
      end
      if @material.user2 != "その他"
        @material.other_users2 = ""
      end
      if @material.user3 != "その他"
        @material.other_users3 = ""
      end
    end
end
