# frozen_string_literal: true

Rails.application.routes.draw do
  mount SdrViewComponents::Engine => '/sdr_view_components'
  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?
  root to: 'rails/welcome#index'
end
