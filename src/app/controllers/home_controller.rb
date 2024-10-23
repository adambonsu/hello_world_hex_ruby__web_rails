require "hello_world_hex_ruby"
class HomeController < ApplicationController
    def index
        @name = params[:name] || "World"
        user_interface = HelloWorldHexRuby::Adaptors::StringUserInterface.new
        core = HelloWorldHexRuby::Core::HelloWorldCore.new(user_interface)
        @message = core.say_hello(@name)
    end
end
