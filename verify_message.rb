#!/usr/bin/env ruby
# bundle exec verify_message.rb

require 'bitcoin'

# configure
chain_config = {
  project: :qtum,
  magic_head: "\xf1\xcf\xa6\xd3",
  message_magic: "Qtum Signed Message:\n",
  address_version: "3a",
  p2sh_version: "32",
  privkey_version: "80",
  extended_privkey_version: "0488ade4",
  extended_pubkey_version: "0488b21e",
  default_port: 3888,
  protocol_version: 0,
  genesis_hash: "0x000075aef83cf2853580f8ae8ce6f8c3096cfa21d98334d6e3f95e5582ed986c",
  alert_pubkeys: []
}

Bitcoin::NETWORKS[:qtum] = chain_config
Bitcoin.network = :qtum
Qtum = Bitcoin


messages = [
  {
    address: "QfyxAJ2TWX6TzSgmqv2uu6mF85JJj342PY",
    message: "0x0079bF6868cB1b7cF4a451311fd70c348F3ED38B",
    sig:     "ILu2UvQFat1gZPvu2c8xbajqiQY9sURFNM+QpxuOvVnUTlOYCc5enrjYOTVVHiynFCPo2qwKKXRRULteBTVyFUY="
  }, {
    address: "QVBvpCzPWQweR6tqnt9UPF3iVTkLtv6pWX",
    message: "0x169D6B29405e725947bE8A308a44F5918815D869",
    sig:     "IGfXC4yCockohqjnHjKGbsVG2wuM5BULLXu85sf7jz+wHTsD1Mg2izSDVROvm9Dp3uh8Z4E4gkXXOzQyJXeaBxo="
  }
]

# bitcoin test signature should return false
puts Qtum.verify_message("13ALM64pKj4B14Bnu2AGu6WhNr4wBhgjeE", "HCT7TP2EQOD5PPrftWW1lYhTGYn5vJB/lnJd1Lf3SLajO85DT/T6N6NvW36PmG7zDTQD47OQOlBJ/wVcqe2LHe4=", "a")

# qtum test signatures should both return true
messages.each do |message|
  puts Qtum.verify_message(message[:address], message[:sig], message[:message])
end
