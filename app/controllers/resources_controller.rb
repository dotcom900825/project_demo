require 'google_scholar_wrapper'

class ResourcesController < ApplicationController
  def search
    @articles = Article.all

    query = params[:q].split.last(5).join(" ")

    @articles = GScholar.search(query)

    respond_to do |format|
      format.json {
        render json: {
          status: 'success',
          value: @articles,
          html: render_to_string(:partial=>'resources/article', :formats=>:html, :locals=>{:articles=>@articles})
        }
      }
    end
  end

  def lan_detect
    query = params[:q]
    language = check_language(query)

    respond_to do |format|
      format.json {
        render json: {
          lan: language,
          loc: "#{request.location.country} / #{request.location.city}"
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
