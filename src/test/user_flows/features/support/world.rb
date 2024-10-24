module World
    def informal_greetings
        @informal_greetings ||= [
            "Hey!",
            "Heya!",
            "Hey there!",
            "Hi",
            "Morning!",
            "How are things?",
            "What's new?",
            "It's good to see you",
            "G'day!",
            "Howdy!",
            "What's up?",
            "How's it going?",
            "What's happening?",
            "What's the story?",
            "Yo!"
        ]
    end

    def formal_greetings
        @formal_greetings ||= [
            "Hello",
            "Hi there"
        ]
    end

    @time_related_formal_greetings = [
        "Good morning",
        "Good afternoon",
        "Good evening"
    ]

    def time_related_formal_greetings
        @time_related_formal_greetings ||= [
            "Good morning",
            "Good afternoon",
            "Good evening"
        ]
    end

    def initial_greetings
        @initial_greetings ||= [
            "It's nice to meet you",
            "It's a pleasure to meet you"
        ]
    end

    def greetings
        @greetings ||= informal_greetings + formal_greetings + time_related_formal_greetings + initial_greetings
    end
end

World(World)
