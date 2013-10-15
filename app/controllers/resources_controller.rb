require 'google_scholar_wrapper'

class ResourcesController < ApplicationController
  def search
    @articles = Article.all

    search_method = params[:m]
    puts search_method
    query = params[:q].split.last(5).join(" ")

    if search_method == '1'
      @articles = GScholar.search(query)
      respond_to do |format|
        format.json {
          render json: {
            status: 'success',
            html: render_to_string(:partial=>'resources/article', :formats=>:html, :locals=>{:articles=>@articles})
          }
        }
      end
      return

    elsif search_method == '2'
      @articles = GoogleCustomSearch.search(query)
      respond_to do |format|
        format.json {
          render json: {
            status: 'success',
            html: render_to_string(:partial=>'resources/custom_search', :formats=>:html, :locals=>{:articles=>@articles})
          }
        }
      end
      return
    end

  end

  def lan_detect
    query = params[:q]
    language = check_language(query)

    city = request.location.city

    respond_to do |format|
      format.json {
        render json: {
          lan: language,
          loc: city
        }
      }
    end


  end

  private

  def check_language(content)
    result = DetectLanguage.simple_detect(content)
    return result
  end



end
