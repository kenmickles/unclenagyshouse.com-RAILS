# encoding: UTF-8

class PagesController < ApplicationController
  def about
    @page_title = "About Uncle Nagy’s House"
  end

  def contact
    @page_title = "Contact Uncle Nagy’s House"
  end

  def subscribe
    @page_title = "Subscribe to Uncle Nagy’s House"
  end
end