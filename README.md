Crouton
=====================
[![Gem Version](https://badge.fury.io/rb/crouton.svg)](http://badge.fury.io/rb/crouton)

Context sensitive notifications for Rails && XHR.

## Installation

    gem install 'crouton'

## Usage

Simply require `crouton` in your javascript and css:

``` javascript
//= require crouton
```

``` sass
@import crouton
```

Now, use the `render_crouton` method in your controllers, any option you pass
will be converted to a message, and displayed in the browser.

``` ruby
class PostsController < ActionController::Base

  def update
    if @post.save
      render_crouton notice: 'Saved'
    else
      render_crouton errors: @post.errors
    end
  end
end
```

## Customization
Three styles are supported out of the box: __info__, __warning__ and __danger__.
The duration of each message is 1500, 2000 and 3000 respectively.

You can customize the colours for this three styles by defining the following SASS variables:
 - `$crouton-info`
 - `$crouton-warning`
 - `$crouton-danger`

You can also create your custom messages:

```ruby
  render_crouton Crouton::Message.new(:hint, 'You can double tap for more info.', duration: 5000)
```

License
--------

    Copyright (c) 2014 Máximo Mussini

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
    OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


Credits
--------

The name and the idea of Crouton originates in a [blog article](http://cyrilmottier.com/2012/07/24/the-making-of-prixing-4-activity-tied-notifications/) by Cyril Mottier.
