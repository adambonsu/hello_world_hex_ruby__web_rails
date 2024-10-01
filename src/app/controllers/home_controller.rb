require "hello_world_hex_ruby"
class HomeController < ApplicationController
    def index
        user_interface = HelloWorldHexRuby::Adaptors::StringUserInterface.new
        core = HelloWorldHexRuby::Core::HelloWorldCore.new(user_interface)
        @message = core.say_hello("from HelloWorldHexRuby::Core")
    end
end
