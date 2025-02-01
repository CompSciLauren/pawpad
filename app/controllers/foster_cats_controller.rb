class FosterCatsController < ApplicationController
  before_action :set_foster_cat, only: [ :show, :edit, :update, :destroy ]
  def index
    @foster_cats = VwFosterCat.all
  end

  def show
  end

  def new
    @foster_cat = FosterCat.new
    @form_fields = VwFosterCat.columns.map(&:name).reject { |field| [ "id", "sex", "breed", "colors" ].include?(field) }
    @animal_sexes = AnimalSex.all
    @cat_breeds = CatBreed.all
    @cat_colors = CatColor.all.presence || []
  end

  def create
    @foster_cat = FosterCat.new(foster_cat_params.except(:color_ids))
    if @foster_cat.save
      save_foster_cat_colors(@foster_cat.id, foster_cat_params[:color_ids])

      redirect_to @foster_cat
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @form_fields = VwFosterCat.columns.map(&:name).reject { |field| [ "id", "sex", "breed", "colors" ].include?(field) }
    @animal_sexes = AnimalSex.all
    @cat_breeds = CatBreed.all
    @cat_colors = CatColor.all.presence || []
  end

  def update
    if @foster_cat.update(foster_cat_params.except(:color_ids))
      save_foster_cat_colors(@foster_cat.id, foster_cat_params[:color_ids])

      redirect_to @foster_cat
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    FosterCatColor.where(cat_id: @foster_cat.id).destroy_all
    @foster_cat.destroy
    redirect_to foster_cats_path
  end

  private

  def set_foster_cat
    @foster_cat = FosterCat.find(params[:id])
  end

  def foster_cat_params
    permitted_params = params.require(:foster_cat).permit(:name, :birth_date, :sex_id, :sex, :breed_id, :breed, color_ids: [])

    permitted_params[:sex_id] = permitted_params.delete(:sex) if permitted_params[:sex]
    permitted_params[:breed_id] = permitted_params.delete(:breed) if permitted_params[:breed]

    permitted_params[:color_ids].reject!(&:blank?) if permitted_params[:color_ids]

    permitted_params
  end

  def save_foster_cat_colors(foster_cat_id, color_ids)
    cat_color_ids = color_ids.reject(&:empty?)
    existing_colors = FosterCatColor.where(cat_id: foster_cat_id).pluck(:color_id)

    colors_to_delete = existing_colors - cat_color_ids.map(&:to_i)

    FosterCatColor.where(cat_id: foster_cat_id, color_id: colors_to_delete).destroy_all

    colors_to_add = cat_color_ids.map(&:to_i) - existing_colors
    colors_to_add.each do |color_id|
      FosterCatColor.create(cat_id: foster_cat_id, color_id: color_id)
    end
  end
end
