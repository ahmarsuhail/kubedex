
BROKER = {
    "gateway_host": "gateway.firedex",
     "broker_host": "broker.firedex",
    "tcp": 1883,
    "udp": 20000
}

TYPES = [ "deterministic", "random" ]

TOPICS = 7
TOPIC = {
    "deterministic": 0,
    "random": 7
}

SUBSCRIBERS = 1
SUBSCRIBER = {
    "scenario": [
        {
            "count": 1,
            "deterministic": {
                "count": 0,
                "utility_function": { "average": 5, "lower_bound": 0.01, "upper_bound": 100 }
            },
            "random": {
                "count": 7,
                "utility_function": { "average": 5, "lower_bound": 0.01, "upper_bound": 100 }
            }
        }
    ]
}

PUBLISHERS = 1
PUBLISHER = {
    "scenario": [
        {
            "count": 1,

            "deterministic": {
                "count": 0,
                "rate": { "average": 100, "lower_bound": 100, "upper_bound": 100 },
                "size": { "average": 100, "lower_bound": 100, "upper_bound": 100 }
            },
            "random": {
                "count": 7,
                "rate": { "average": 100, "lower_bound": 100, "upper_bound": 100 },
                "size": { "average": 100, "lower_bound": 100, "upper_bound": 100 }
            }
        }
    ]

}
