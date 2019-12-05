class ProviderUpdatesController < ApplicationController
  def index
    @provider_updates = ProviderUpdate.all

    render("provider_update_templates/index.html.erb")
  end

  def show
    @provider_update = ProviderUpdate.find(params.fetch("id_to_display"))

    render("provider_update_templates/show.html.erb")
  end

  def new_form
    @provider_update = ProviderUpdate.new

    render("provider_update_templates/new_form.html.erb")
  end

  def create_row
    @provider_update = ProviderUpdate.new

    @provider_update.breakfast = params.fetch("breakfast")
    @provider_update.lunch = params.fetch("lunch")
    @provider_update.snacks = params.fetch("snacks")
    @provider_update.activities = params.fetch("activities")
    @provider_update.user_id = params.fetch("user_id")
    @provider_update.date = params.fetch("date")
    @provider_update.reminders = params.fetch("reminders")
    @provider_update.venue_id = params.fetch("venue_id")

    if @provider_update.valid?
      @provider_update.save

      redirect_back(:fallback_location => "/provider_updates", :notice => "Provider update created successfully.")
    else
      render("provider_update_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_venue
    @provider_update = ProviderUpdate.new

    @provider_update.breakfast = params.fetch("breakfast")
    @provider_update.lunch = params.fetch("lunch")
    @provider_update.snacks = params.fetch("snacks")
    @provider_update.activities = params.fetch("activities")
    @provider_update.user_id = params.fetch("user_id")
    @provider_update.date = params.fetch("date")
    @provider_update.reminders = params.fetch("reminders")
    @provider_update.venue_id = params.fetch("venue_id")

    if @provider_update.valid?
      @provider_update.save

      redirect_to("/venues/#{@provider_update.venue_id}", notice: "ProviderUpdate created successfully.")
    else
      render("provider_update_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @provider_update = ProviderUpdate.find(params.fetch("prefill_with_id"))

    render("provider_update_templates/edit_form.html.erb")
  end

  def update_row
    @provider_update = ProviderUpdate.find(params.fetch("id_to_modify"))

    @provider_update.breakfast = params.fetch("breakfast")
    @provider_update.lunch = params.fetch("lunch")
    @provider_update.snacks = params.fetch("snacks")
    @provider_update.activities = params.fetch("activities")
    @provider_update.user_id = params.fetch("user_id")
    @provider_update.date = params.fetch("date")
    @provider_update.reminders = params.fetch("reminders")
    @provider_update.venue_id = params.fetch("venue_id")

    if @provider_update.valid?
      @provider_update.save

      redirect_to("/provider_updates/#{@provider_update.id}", :notice => "Provider update updated successfully.")
    else
      render("provider_update_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @provider_update = ProviderUpdate.find(params.fetch("id_to_remove"))

    @provider_update.destroy

    redirect_to("/users/#{@provider_update.user_id}", notice: "ProviderUpdate deleted successfully.")
  end

  def destroy_row_from_venue
    @provider_update = ProviderUpdate.find(params.fetch("id_to_remove"))

    @provider_update.destroy

    redirect_to("/venues/#{@provider_update.venue_id}", notice: "ProviderUpdate deleted successfully.")
  end

  def destroy_row
    @provider_update = ProviderUpdate.find(params.fetch("id_to_remove"))

    @provider_update.destroy

    redirect_to("/provider_updates", :notice => "Provider update deleted successfully.")
  end
end
