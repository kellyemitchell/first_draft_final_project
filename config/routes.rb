Rails.application.routes.draw do
  # Routes for the Provider update resource:

  # CREATE
  get("/provider_updates/new", { :controller => "provider_updates", :action => "new_form" })
  post("/create_provider_update", { :controller => "provider_updates", :action => "create_row" })

  # READ
  get("/provider_updates", { :controller => "provider_updates", :action => "index" })
  get("/provider_updates/:id_to_display", { :controller => "provider_updates", :action => "show" })

  # UPDATE
  get("/provider_updates/:prefill_with_id/edit", { :controller => "provider_updates", :action => "edit_form" })
  post("/update_provider_update/:id_to_modify", { :controller => "provider_updates", :action => "update_row" })

  # DELETE
  get("/delete_provider_update/:id_to_remove", { :controller => "provider_updates", :action => "destroy_row" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  get("/photos/new", { :controller => "photos", :action => "new_form" })
  post("/create_photo", { :controller => "photos", :action => "create_row" })

  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id_to_display", { :controller => "photos", :action => "show" })

  # UPDATE
  get("/photos/:prefill_with_id/edit", { :controller => "photos", :action => "edit_form" })
  post("/update_photo/:id_to_modify", { :controller => "photos", :action => "update_row" })

  # DELETE
  get("/delete_photo/:id_to_remove", { :controller => "photos", :action => "destroy_row" })

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
