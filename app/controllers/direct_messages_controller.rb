class DirectMessagesController < ApplicationController
  before_action :current_user_must_be_direct_message_sender, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_direct_message_sender
    direct_message = DirectMessage.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == direct_message.sender
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = DirectMessage.ransack(params[:q])
    @direct_messages = @q.result(:distinct => true).includes(:parent, :sender).page(params[:page]).per(10)

    render("direct_message_templates/index.html.erb")
  end

  def show
    @direct_message = DirectMessage.find(params.fetch("id_to_display"))

    render("direct_message_templates/show.html.erb")
  end

  def new_form
    @direct_message = DirectMessage.new

    render("direct_message_templates/new_form.html.erb")
  end

  def create_row
    @direct_message = DirectMessage.new

    @direct_message.sender_id = params.fetch("sender_id")
    @direct_message.parent_id = params.fetch("parent_id")
    @direct_message.body = params.fetch("body")

    if @direct_message.valid?
      @direct_message.save

      redirect_back(:fallback_location => "/direct_messages", :notice => "Direct message created successfully.")
    else
      render("direct_message_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @direct_message = DirectMessage.find(params.fetch("prefill_with_id"))

    render("direct_message_templates/edit_form.html.erb")
  end

  def update_row
    @direct_message = DirectMessage.find(params.fetch("id_to_modify"))

    
    @direct_message.parent_id = params.fetch("parent_id")
    @direct_message.body = params.fetch("body")

    if @direct_message.valid?
      @direct_message.save

      redirect_to("/direct_messages/#{@direct_message.id}", :notice => "Direct message updated successfully.")
    else
      render("direct_message_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_parent
    @direct_message = DirectMessage.find(params.fetch("id_to_remove"))

    @direct_message.destroy

    redirect_to("/users/#{@direct_message.parent_id}", notice: "DirectMessage deleted successfully.")
  end

  def destroy_row_from_sender
    @direct_message = DirectMessage.find(params.fetch("id_to_remove"))

    @direct_message.destroy

    redirect_to("/users/#{@direct_message.sender_id}", notice: "DirectMessage deleted successfully.")
  end

  def destroy_row
    @direct_message = DirectMessage.find(params.fetch("id_to_remove"))

    @direct_message.destroy

    redirect_to("/direct_messages", :notice => "Direct message deleted successfully.")
  end
end
