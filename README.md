# Padrino Decorator

padrino-decorator is a gem for [Padrino](http://www.padrinorb.com/).  
Adds an object-oriented layer of presentation logic to your Padrino application.

[![Build Status](https://travis-ci.org/tyabe/padrino-decorator.png?branch=master)](https://travis-ci.org/tyabe/padrino-decorator)

## Installation

Add the following to your `Gemfile`:

```ruby
gem 'padrino-decorator'
```

And then execute:

```plain
$ bundle
```

## Decorator Generator

Padrino provides generator support for quickly creating new decorators within your Padrino application.
Note that the decorator tests are generated specifically tailored towards the testing framework chosen during application generation.

Very important to note that decorator generators are intended primarily to work within applications
created through the Padrino application generator and that follow Padrino conventions.

Using the decorator generator is as simple as:

```plain
$ padrino-gen decorator User
```

<table>
  <thead>
    <tr>
      <th>Options</th>
      <th>Default</th>
      <th>Aliases</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>root</th>
      <th>.</th>
      <th>-r</th>
      <th>specify the root destination path</th>
    </tr>
    <tr>
      <th>app</th>
      <th>/app</th>
      <th>-a</th>
      <th>specify the application</th>
    </tr>
    <tr>
      <th>destroy</th>
      <th>false</th>
      <th>-d</th>
      <th>removes all generated files</th>
    </tr>
    <tr>
      <th>namespace</th>
      <th></th>
      <th>-n</th>
      <th>specify the name space of your padrino project</th>
    </tr>
  </tbody>
</table>

## Examples

```ruby
# app/controllers/posts.rb
SampleProject::App.controllers :posts do

  get :index do
    source = Post.all
    @posts = decorate(source)
    render 'posts/index'
  end

  get :show, with: :id do
    source = Post.find(params[:id])
    @post = decorate(source)
    # or
    @post = PostDecorator.new(source, context: self)
    render 'posts/show'
  end

end

# app/decorators/post_decorator.rb
class PostDecorator < Padrino::Decorator::Base
  context SampleProject::App

  def formated_body
    h.simple_format(object.body)
  end

end

# app/views/posts/show.slim
h1 = @post.title
div
  = @post.formated_body
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2013 Takeshi Yabe. See LICENSE for details.
