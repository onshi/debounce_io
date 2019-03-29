# DebounceIo

DebounceIo is a Ruby wrapper for the [DebounceIo API](https://debounce.io/email-verification-api/).  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'debounce_io'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install debounce_io

## Usage

Set environment variable `DEBOUNCE_IO_API_KEY`.
```ruby
# basic lookup version
DebounceIo::Lookup.call('example@example.com')
# OpenStruct {
#                  :email => "example@example.com",
#                   :code => "6",
#                   :role => "false",
#             :free_email => "false",
#                 :result => "Invalid",
#                 :reason => "Bounce",
#     :send_transactional => "0"
# }
 
# extended lookup version
DebounceIo::Lookup.call('mohsen@gmail.com', append: true)
# OpenStruct {
#                  :email => "mohsen@gmail.com",
#                   :code => "5",
#                   :role => "false",
#             :free_email => "true",
#                 :result => "Safe to Send",
#                 :reason => "Deliverable",
#     :send_transactional => "1",
#               :fullname => "Mohsen Javdani",
#              :firstname => "Mohsen",
#               :lastname => "Javdani",
#                  :photo => "photo_url"
# }
DebounceIo::Balance.call
# OpenStruct {
#     :balance => "42"
# }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Always welcome. As this gem currently support `ruby 2.6` if you need support for older version feel free to open issue. Bug reports and pull requests are welcome on GitHub at https://github.com/onshi/debounce_io. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DebounceIo project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/onshi/debounce_io/blob/master/CODE_OF_CONDUCT.md).
