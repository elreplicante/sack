# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Sack::Application.config.secret_key_base = '5d16f944bb35f10587e4d609cf5c9834d25bcb6a17e41a12422d84c962d44e28c507790e72cfb6c14e43f50d8b9bcef5aa5947f1be75279d46455116ef931c62'
