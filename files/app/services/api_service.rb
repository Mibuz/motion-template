class ApiService
  API_URL = ''
  PARAMS = { }

  def fetch(&block)
    AFMotion::JSON.get(API_URL, PARAMS) do |response|
      if response.success?
        # App::Persistence['Resource'] = response.object
        block.call(true)
      else
        block.call(false)
      end
    end
  end
end
