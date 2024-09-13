
require 'hello_world_hex_ruby'
class GreetingsController < ApplicationController
    def hello
        user_interface = HelloWorldHexRuby::Adaptors::StringUserInterface.new
        core = HelloWorldHexRuby::Core::HelloWorldCore.new(user_interface)

        render plain: (core.say_hello('from Rails!'))

    end
end
