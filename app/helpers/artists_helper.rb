# -*- coding: utf-8 -*-
module ArtistsHelper
  def link_to_artist(artist_username)
    link_to artist_username, "/artists/#{artist_username}"
  end

  def path_to_artist(artist_username)
    "/artists/#{artist_username}"
  end

  # Return search key words
  def search_key_words(params)
    keywords_list = ""
    keywords_list += " してほしいこと: <span class='label'>#{params[:interest_tag]}</span>" if params[:interest_tag].present?
    keywords_list += " できること: <span class='label'>#{params[:skill_tag]}</span>" if params[:skill_tag].present?
    keywords_list += " 活動地域: <span class='label'>#{params[:area_tag]}</span>" if params[:area_tag].present?
    keywords_list += " フリーワード: <span class='label'>#{params[:free_word_tag]}</span>" if params[:free_word_tag].present?
    keywords_list += " 名前、自己紹介: <span class='label'>#{params[:search_word]}</span>" if params[:search_word].present?
    keywords_list += " ジャンル: <span class='label'>#{Genre.find(params[:genre_id]).name}</span>" if params[:genre_id].present?
    if keywords_list.present?
      ("<p><b>絞り込み条件</b>" + keywords_list + "</p>").html_safe
    end
  end

  # Return link to tags search.
  def link_to_add_retrieval_tag(tag_name, tag_type, params, css_class)
    retrieval_conditions = { }

    if tag_type == "interest"
      retrieval_conditions.store(:interest_tag ,tag_name)
    elsif params[:interest_tag].present?
      retrieval_conditions.store(:interest_tag ,params[:interest_tag] )
    end

    if tag_type == "skill"
      retrieval_conditions.store(:skill_tag ,tag_name)
    elsif params[:skill_tag].present?
      retrieval_conditions.store(:skill_tag ,params[:skill_tag] )
    end

    if tag_type == "area"
      retrieval_conditions.store(:area_tag ,tag_name)
    elsif params[:area_tag].present?
      retrieval_conditions.store(:area_tag ,params[:area_tag] )
    end

    if tag_type == "free_word"
      retrieval_conditions.store(:free_word_tag ,tag_name)
    elsif params[:free_word_tag].present?
      retrieval_conditions.store(:free_word_tag ,params[:free_word_tag] )
    end

    if params[:genre_id].present?
      retrieval_conditions.store(:genre_id ,params[:genre_id] )
    end

    if params[:search_word].present?
      retrieval_conditions.store(:search_word ,params[:search_word] )
    end

    link_to( tag_name, artists_path(retrieval_conditions), :class => css_class)
  end
end
