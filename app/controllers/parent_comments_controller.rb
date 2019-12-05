class ParentCommentsController < ApplicationController
  def index
    @parent_comments = ParentComment.all

    render("parent_comment_templates/index.html.erb")
  end

  def show
    @parent_comment = ParentComment.find(params.fetch("id_to_display"))

    render("parent_comment_templates/show.html.erb")
  end

  def new_form
    @parent_comment = ParentComment.new

    render("parent_comment_templates/new_form.html.erb")
  end

  def create_row
    @parent_comment = ParentComment.new

    @parent_comment.user_id = params.fetch("user_id")
    @parent_comment.body = params.fetch("body")

    if @parent_comment.valid?
      @parent_comment.save

      redirect_back(:fallback_location => "/parent_comments", :notice => "Parent comment created successfully.")
    else
      render("parent_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @parent_comment = ParentComment.find(params.fetch("prefill_with_id"))

    render("parent_comment_templates/edit_form.html.erb")
  end

  def update_row
    @parent_comment = ParentComment.find(params.fetch("id_to_modify"))

    @parent_comment.user_id = params.fetch("user_id")
    @parent_comment.body = params.fetch("body")

    if @parent_comment.valid?
      @parent_comment.save

      redirect_to("/parent_comments/#{@parent_comment.id}", :notice => "Parent comment updated successfully.")
    else
      render("parent_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @parent_comment = ParentComment.find(params.fetch("id_to_remove"))

    @parent_comment.destroy

    redirect_to("/users/#{@parent_comment.user_id}", notice: "ParentComment deleted successfully.")
  end

  def destroy_row
    @parent_comment = ParentComment.find(params.fetch("id_to_remove"))

    @parent_comment.destroy

    redirect_to("/parent_comments", :notice => "Parent comment deleted successfully.")
  end
end
