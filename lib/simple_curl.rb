class SimpleCurl

  ## opts : ssl=>true/false, method=>'get'/'post'
  def self.req(url, opts)
    return if url.blank?

    uri = URI.parse(url)

    Rails.logger.debug url

    http = Net::HTTP.new(uri.host, uri.port)

    if opts[:ssl]
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    if opts[:method] == 'get'
      request = Net::HTTP::Get.new(uri.request_uri)
    elsif opts[:method] == 'post'
      request = Net::HTTP::Post.new(uri.request_uri)
    else
      return
    end

    request.body = opts[:body] unless opts[:body].blank?
    request.content_type = opts[:content_type] unless opts[:content_type].blank?

    begin
      res= http.request(request)
    rescue Exception => msg
      Rails.logger.debug "curl exception: #{msg}"
      return
    end

    if res.code.to_i != 200
      Rails.logger.debug "curl res code: #{res.code} not 200"
      return
    end

    res.body
  end

end
