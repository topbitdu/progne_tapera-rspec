# Progne Tapera RSpec 枚举 RSpec 库

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/progne_tapera-rspec/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/progne_tapera-rspec.svg)](https://badge.fury.io/rb/progne_tapera-rspec)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/progne_tapera-rspec.svg)](https://gemnasium.com/github.com/topbitdu/progne_tapera-rspec)

Progne Tapera RSpec is a RSpec-based Shared Example for the Progne Tapera-based enum implementation. Progne Tapera RSpec 是为 Progne Tapera 设计的基于 RSpec 的共享测试用例。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'progne_tapera-rspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install progne_tapera-rspec

## Usage

Create the RSpec examples for your enum code (assume the enum code is Gender):

```ruby
require 'rails_helper'

RSpec.describe Gender, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 3, [
    { code: '1', name: 'male',          localized_name: '男'     },
    { code: '2', name: 'female',        localized_name: '女'     },
    { code: '9', name: 'not_specified', localized_name: '未指定' } ]

end
```

Create the RSpec examples for your model which has the #gender_code attribute (assume the model is Person):

```ruby
# person.rb
class Person < ApplicationRecord

  include Unidom::Common::ModelExtension
  include ProgneTapera::EnumCode

  code :gender # 这里将 #gender_code 字段和 Gender 枚举型集成起来。

end

# person_spec.rb
require 'rails_helper'

describe Person, type: :model do

  context do
    @person = Person.new
    it_behaves_like 'ProgneTapera::EnumCode', @person, :gender, Gender
  end

end
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/progne_tapera-rspec. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

