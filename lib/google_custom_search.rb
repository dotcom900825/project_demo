require 'JSON'
require 'rest_client'

class GoogleCustomSearch

  API_URL = 'https://www.googleapis.com/customsearch/v1'
  API_KEY = "AIzaSyArixtoXf1D6RDZgSiZ4jDVmn1rugPIzXI"
  CX = "012829042586779157422:yzz4wjde4ma"

  def self.search(query)
    response = RestClient.get API_URL, {:params => {:key => API_KEY, :cx => CX, :q => query}}
    data = JSON.parse(response)
    return data['items']
  end
end
