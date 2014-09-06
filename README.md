# whitepages

[http://whitepages.rubyforge.org](http://whitepages.rubyforge.org)

The Whitepages Gem provides a library for consuming the web services provided by [http://whitepages.rubyforge.org](http://whitepages.rubyforge.org). More information on the Developer API may be found at [http://developer.whitepages.com/](http://developer.whitepages.com/). This API may be used to lookup people by name as well as reverse lookups based on phone number or address.

There are a couple of limitations to consider (refer to the Whitepages website for any changes):

	* Maximum of 1,500 calls per day per API key
	* Throttle set at 2 searches per second per API key

## Example

```ruby
require 'rubygems'
require 'whitepages'

API_KEY = "api_key_here"

wp = Whitepages.new(API_KEY)

#Query a person based on name, where state is optional
#This will return multiple listings if they exist
#More options are available here: 
#http://developer.whitepages.com/docs/Methods/find_person
data = wp.find_person({ "lastname" => "Smith", 
                        "state"    => "CO" })

#Query an entry based on phone, where state is optional
#More options are available here:
#http://developer.whitepages.com/docs/Methods/reverse_phone
data = wp.reverse_phone({ "phone"   => "4155551212", 
                          "state"   => "CA" })

#Query an entry based on address, where state and city are optional
#More options are available here:
#http://developer.whitepages.com/docs/Methods/reverse_address
data = wp.reverse_address({ "street"  => "1301 Fifth Ave", 
                            "city"    => "Seattle",
                            "state"   => "WA" })
```

## Requirements

	* xmlsimple 
	* rest_client

## Install

	sudo gem install jsgoecke-whitepages --source=http://gems.github.com/

## License

The MIT License
 
Copyright (c) 2014 Jason Goecke
 
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.