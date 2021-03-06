class PhotosController < ApplicationController
  def index
    @q = Photo.ransack(params[:q])
    @photos = @q.result(:distinct => true).includes(:user, :venue).page(params[:page]).per(10)

    render("photo_templates/index.html.erb")
  end

  def show
    @photo = Photo.find(params.fetch("id_to_display"))

    render("photo_templates/show.html.erb")
  end

  def new_form
    @photo = Photo.new

    render("photo_templates/new_form.html.erb")
  end

  def create_row
    @photo = Photo.new

    @photo.user_id = params.fetch("user_id")
    @photo.date = params.fetch("date")
    @photo.caption = params.fetch("caption")
    @photo.venue_id = params.fetch("venue_id")
    @photo.photo_location = params.fetch("photo_location")

    if @photo.valid?
      @photo.save

      redirect_back(:fallback_location => "/photos", :notice => "Photo created successfully.")
    else
      render("photo_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_venue
    @photo = Photo.new

    @photo.user_id = params.fetch("user_id")
    @photo.date = params.fetch("date")
    @photo.caption = params.fetch("caption")
    @photo.venue_id = params.fetch("venue_id")
    @photo.photo_location = params.fetch("photo_location")

    if @photo.valid?
      @photo.save

      redirect_to("/venues/#{@photo.venue_id}", notice: "Photo created successfully.")
    else
      render("photo_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @photo = Photo.find(params.fetch("prefill_with_id"))

    render("photo_templates/edit_form.html.erb")
  end

  def update_row
    @photo = Photo.find(params.fetch("id_to_modify"))

    @photo.user_id = params.fetch("user_id")
    @photo.date = params.fetch("date")
    @photo.caption = params.fetch("caption")
    @photo.venue_id = params.fetch("venue_id")
    @photo.photo_location = params.fetch("photo_location")

    if @photo.valid?
      @photo.save

      redirect_to("/photos/#{@photo.id}", :notice => "Photo updated successfully.")
    else
      render("photo_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/users/#{@photo.user_id}", notice: "Photo deleted successfully.")
  end

  def destroy_row_from_venue
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/venues/#{@photo.venue_id}", notice: "Photo deleted successfully.")
  end

  def destroy_row
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/photos", :notice => "Photo deleted successfully.")
  end
end
