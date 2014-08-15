Crouton [![Gem Version](https://badge.fury.io/rb/crouton.svg)](http://badge.fury.io/rb/crouton) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/ElMassimo/queryable/blob/master/LICENSE.txt)
=====================

Context sensitive notifications for Rails && XHR.

## Installation

    gem install 'crouton'

## Usage

Simply require `crouton` in your javascript and css:

``` javascript
//= require crouton
```

``` sass
@import 'crouton';
```

Then, use the `render_crouton` method in your controllers, any option you pass
will be converted to a message.

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

Finally, find a good spot in your HTML for the Crouton, and add the
`.crouton-placeholder` CSS class in the container of choice.

```html
<div class="content crouton-placeholder">
  ...
```

## Customization
Three styles are supported out of the box: __info__, __warning__ and __danger__.
The duration of each message is 1500, 2000 and 3000 respectively.

![screen shot 2014-08-11 at 3 44 10 pm](https://cloud.githubusercontent.com/assets/1158253/3881070/74f526c4-218a-11e4-8ada-63110a789647.png)
![screen shot 2014-08-11 at 3 43 44 pm](https://cloud.githubusercontent.com/assets/1158253/3881068/74eb79e4-218a-11e4-9734-3a118e9ff853.png)
![screen shot 2014-08-11 at 3 43 23 pm](https://cloud.githubusercontent.com/assets/1158253/3881069/74ebb8a0-218a-11e4-90e6-3efe5cfade53.png)

You can customize the colours for this three styles by defining the following SASS variables:
 - `$crouton-info`
 - `$crouton-warning`
 - `$crouton-danger`

You can also create your custom messages:

```ruby
render_crouton Crouton::Message.new(:hint, 'You can double tap for more info.', duration: 5000), placeholder: '.custom-crouton-placeholder'
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
