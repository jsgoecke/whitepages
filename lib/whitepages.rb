require 'json'
require 'net/https'
require 'uri'

#This class holds the methods for consuming the Whitepages API
class Whitepages

  #Initialize the Whitepages class
  # * api_key - The API key obtained from the Whitpages Developer website
  def initialize(api_key)
    api_version = "1.0"
    
    @api_key = api_key
    @base_uri = "http://api.whitepages.com/"
    @find_person_uri = @base_uri + "find_person/" + api_version + "/?"
    @reverse_phone_uri = @base_uri + "reverse_phone/" + api_version + "/?"
    @reverse_address_uri = @base_uri + "reverse_address/" + api_version + "/?"
    
    @uri = URI.parse(@base_uri)
    @http = Net::HTTP.new(@uri.host, @uri.port)
  end
  
  #Retrieves contact information about a person, such as a telephone number and address
  #Accepts a hash:
  # * firstname - First Name
  # * lastname - Last Name (*REQUIRED*)
  # * house - May take a range, in the form [start-end]
  # * apt - Apartment
  # * street - Street
  # * city - City
  # * state - State
  # * zip - ZipCode/PostalCode
  # * areacode - AreaCode
  # * metro - Whether or not to expand the search to the metro area
  #More details may be found here: http://developer.whitepages.com/docs/Methods/find_person
  def find_person(options)
    resp, data = @http.get(build_uri(options, "find_person"))
    if resp.code== 200
      return JSON.parse(data)
    else
      raise Exception,"code",resp.code
    end

  end

  #Retrieves contact information about a telephone number
  #Accepts a hash:
  # * phone - May be 7 digits if state provided otherwise 10 (*REQUIRED*)
  # * state - Two digit code for the state
  #More details may be found here: http://developer.whitepages.com/docs/Methods/reverse_phone
  def reverse_phone(options)  
    resp, data = @http.get(build_uri(options, "reverse_phone"))

    if resp.code== 200
      return JSON.parse(data)
    else
      raise Exception,"code",resp.code
    end

  end
  
  #Retrieves contact information about the people at an address
  # * house - May take a range, in the form [start-end]
  # * apt - Apartment
  # * street - Street (*REQUIRED*)
  # * city - City
  # * state - State
  # * zip - ZipCode/PostalCode
  # * areacode - AreaCode
  #More details may be found here: http://developer.whitepages.com/docs/Methods/reverse_address
  def reverse_address(options)
    resp, data = @http.get(build_uri(options, "reverse_address"))
    if resp.code== 200
      return JSON.parse(data)
    else
      raise Exception,"code",resp.code
    end
  end
  
  private 
  
  #Build the appropriate URL
  def build_uri(options, type)
    case type
    when "reverse_phone"
      built_uri = @reverse_phone_uri
    when "reverse_address"
      built_uri = @reverse_address_uri
    when "find_person"
      built_uri = @find_person_uri
    end
    
    options.each do |key,value|
      if value != nil
        built_uri = built_uri + key + "=" + value.gsub(' ', '%20') + ";"
      end
    end
    
    built_uri = built_uri + "api_key=" + @api_key + ";outputtype=JSON"
    return built_uri
  end
    
end
