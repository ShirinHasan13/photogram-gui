Rails.application.routes.draw do
  get("/", { :controller => "pages", :action => "home" })
  
  get("/users", { :controller => "users", :action => "index" })
  post("/users/update", { :controller => "users", :action => "update" })
  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:toast_id", { :controller => "photos", :action => "baii" })
  get("/insert_photo", { :controller => "photos", :action => "create" })
  post("/update_photo/:modify_id", { :controller => "photos", :action => "update" })
end
