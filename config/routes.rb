Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "venues#index"
  # Routes for the Direct message resource:

  # CREATE
  get("/direct_messages/new", { :controller => "direct_messages", :action => "new_form" })
  post("/create_direct_message", { :controller => "direct_messages", :action => "create_row" })

  # READ
  get("/direct_messages", { :controller => "direct_messages", :action => "index" })
  get("/direct_messages/:id_to_display", { :controller => "direct_messages", :action => "show" })

  # UPDATE
  get("/direct_messages/:prefill_with_id/edit", { :controller => "direct_messages", :action => "edit_form" })
  post("/update_direct_message/:id_to_modify", { :controller => "direct_messages", :action => "update_row" })

  # DELETE
  get("/delete_direct_message/:id_to_remove", { :controller => "direct_messages", :action => "destroy_row" })
  get("/delete_direct_message_from_sender/:id_to_remove", { :controller => "direct_messages", :action => "destroy_row_from_sender" })
  get("/delete_direct_message_from_parent/:id_to_remove", { :controller => "direct_messages", :action => "destroy_row_from_parent" })

  #------------------------------

  # Routes for the Parent comment resource:

  # CREATE
  get("/parent_comments/new", { :controller => "parent_comments", :action => "new_form" })
  post("/create_parent_comment", { :controller => "parent_comments", :action => "create_row" })

  # READ
  get("/parent_comments", { :controller => "parent_comments", :action => "index" })
  get("/parent_comments/:id_to_display", { :controller => "parent_comments", :action => "show" })

  # UPDATE
  get("/parent_comments/:prefill_with_id/edit", { :controller => "parent_comments", :action => "edit_form" })
  post("/update_parent_comment/:id_to_modify", { :controller => "parent_comments", :action => "update_row" })

  # DELETE
  get("/delete_parent_comment/:id_to_remove", { :controller => "parent_comments", :action => "destroy_row" })
  get("/delete_parent_comment_from_user/:id_to_remove", { :controller => "parent_comments", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Provider update resource:

  # CREATE
  get("/provider_updates/new", { :controller => "provider_updates", :action => "new_form" })
  post("/create_provider_update", { :controller => "provider_updates", :action => "create_row" })
  post("/create_provider_update_from_venue", { :controller => "provider_updates", :action => "create_row_from_venue" })

  # READ
  get("/provider_updates", { :controller => "provider_updates", :action => "index" })
  get("/provider_updates/:id_to_display", { :controller => "provider_updates", :action => "show" })

  # UPDATE
  get("/provider_updates/:prefill_with_id/edit", { :controller => "provider_updates", :action => "edit_form" })
  post("/update_provider_update/:id_to_modify", { :controller => "provider_updates", :action => "update_row" })

  # DELETE
  get("/delete_provider_update/:id_to_remove", { :controller => "provider_updates", :action => "destroy_row" })
  get("/delete_provider_update_from_venue/:id_to_remove", { :controller => "provider_updates", :action => "destroy_row_from_venue" })
  get("/delete_provider_update_from_user/:id_to_remove", { :controller => "provider_updates", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  get("/photos/new", { :controller => "photos", :action => "new_form" })
  post("/create_photo", { :controller => "photos", :action => "create_row" })
  post("/create_photo_from_venue", { :controller => "photos", :action => "create_row_from_venue" })

  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id_to_display", { :controller => "photos", :action => "show" })

  # UPDATE
  get("/photos/:prefill_with_id/edit", { :controller => "photos", :action => "edit_form" })
  post("/update_photo/:id_to_modify", { :controller => "photos", :action => "update_row" })

  # DELETE
  get("/delete_photo/:id_to_remove", { :controller => "photos", :action => "destroy_row" })
  get("/delete_photo_from_venue/:id_to_remove", { :controller => "photos", :action => "destroy_row_from_venue" })
  get("/delete_photo_from_user/:id_to_remove", { :controller => "photos", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Venue resource:

  # CREATE
  get("/venues/new", { :controller => "venues", :action => "new_form" })
  post("/create_venue", { :controller => "venues", :action => "create_row" })

  # READ
  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues/:id_to_display", { :controller => "venues", :action => "show" })

  # UPDATE
  get("/venues/:prefill_with_id/edit", { :controller => "venues", :action => "edit_form" })
  post("/update_venue/:id_to_modify", { :controller => "venues", :action => "update_row" })

  # DELETE
  get("/delete_venue/:id_to_remove", { :controller => "venues", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
