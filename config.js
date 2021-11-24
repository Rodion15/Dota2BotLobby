var config = {};

var dota2 = require("dota2");

// Database settings
config.mysql1 = {
    host:     '127.0.0.1',
    user:     'root',
    password: '',
    database: 'bot'
};

config.mysql = {
    host:     '46.173.221.33',
	port:     '3317',
    user:     'bot',
    password: 'U3s2P1c6',
    database: 'user1002298_bot'
};


config.lobby_timeout = 120; // Lobby bot timeout (seconds, or value 'none')
config.match_users = 2; // Persons in lobby for start match (max 10)
config.remaining_before_match = 10; // Seconds remaining before start match

// Default lobby settings
config.lobby_preset = {
    server_region: dota2.ServerRegion.EUROPE
};

module.exports = config;