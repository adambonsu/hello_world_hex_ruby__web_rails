module World
    def greetings
        @greetings ||= [ "Hello" ]
    end
end

World(World)
