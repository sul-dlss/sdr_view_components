Rails.application.routes.draw do
  mount Sdr::ViewComponents::Engine => "/sdr-view_components"
  root to: "rails/welcome#index"
end
