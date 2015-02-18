# Uses Google Image Search to get an image URL for a search term.
#
#     ImageFetcher.new.fetch('dog')
#     => "http://www.cdc.gov/animalimportation/images/dog2.jpg"
#
#
# The `fetch` method returns an image URL, or an empty string if no image was found.
class ImageFetcher
  def fetch(term)
    url = query_url(term)
    Rails.logger.debug "Querying #{url}"
 
    response = Net::HTTP.get_response(URI.parse(url))
    result_from_response(response)
  end
 
  private
 
  def query_url(term)
    params = default_params.merge(q: term)
    'http://ajax.googleapis.com/ajax/services/search/images?' + params.to_param
  end
 
  def result_from_response(response)
    response = JSON.parse(response.body)
    response['responseData']['results'].first['url']
  rescue
    # no result (or unknown response format), so return an empty string
    ''
  end
 
  def default_params
    {
      rsz: '8',
      imgsz: 'medium',
      imgtype: 'photo',
      safe: 'active',
      v: '1.0'
    }
  end
end