# -*- coding: utf-8 -*-
module OffersHelper
  
  def display_status(status)
    case status
    when Offer::UNEVALUATED
      return "<span class='label'>未回答</span>".html_safe
    when Offer::ACCEPTED
      return "<span class='label success'>受諾</span>".html_safe
    when Offer::REJECTED
      return "<span class='label important'>拒否</span>".html_safe
    end
  end
end
