class FosterCatsController < ApplicationController
  before_action :set_foster_cat, only: [ :show, :edit, :update, :destroy ]
  before_action :set_form_fields_and_resources, only: [ :new, :create, :edit ]

  def index
    @foster_cats = VwFosterCat.all
  end

  def show
  end

  def new
    @foster_cat = FosterCat.new
  end

  def create
    @foster_cat = FosterCat.new(foster_cat_params.except(:foster_cat_colors))
    if @foster_cat.foster_cat_colors.build(foster_cat_colors_params) && @foster_cat.save
      redirect_to @foster_cat
    else
      flash.now[:alert] = "There was an error saving the foster cat. Please review the form."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @foster_cat.update(foster_cat_params.except(:foster_cat_colors))
      save_foster_cat_colors(@foster_cat.id, foster_cat_params[:foster_cat_colors])

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

  def set_form_fields_and_resources
    @form_fields = VwFosterCat.columns.map(&:name).reject { |field| [ "id", "sex", "breed", "colors" ].include?(field) }
    @animal_sexes = AnimalSex.all
    @cat_breeds = CatBreed.all
    @cat_colors = CatColor.all.presence || []
  end

  def foster_cat_params
    permitted_params = params.require(:foster_cat).permit(:name, :birth_date, :sex_id, :sex, :breed_id, :breed, foster_cat_colors: [])

    permitted_params[:sex_id] = permitted_params.delete(:sex) if permitted_params[:sex]
    permitted_params[:breed_id] = permitted_params.delete(:breed) if permitted_params[:breed]

    permitted_params[:foster_cat_colors].reject!(&:blank?) if permitted_params[:foster_cat_colors]

    permitted_params
  end

  def foster_cat_colors_params
    foster_cat_params[:foster_cat_colors].map do |color_id|
      { color_id: color_id }
    end
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
