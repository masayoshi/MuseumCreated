# -*- coding: utf-8 -*-
module WorksHelper

  # Return search key words
  def search_tag(params)
    keywords_list = ""
    keywords_list += " アーティスト: <span class='label'>#{params[:username]}</span>" if params[:username].present?
    keywords_list += " タグ: <span class='label'>#{params[:tag]}</span>" if params[:tag].present?
    if keywords_list.present?
      ("<p><b>絞り込み条件</b>" + keywords_list + "</p>").html_safe
    end
  end
  
  # Rreturn link to tags search
  def link_to_tagged_works(tag_name, params, css_class)
    if params[:username].present?
      link_to( tag_name, artist_works_path(params[:username],:tag => tag_name), :class => css_class)
    else
      link_to(tag_name, works_path(:tag => tag_name) , :class => css_class)
    end
  end
end
