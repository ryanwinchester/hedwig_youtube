# Hedwig Youtube Responder

[![Hex.pm](https://img.shields.io/hexpm/v/hedwig_youtube.svg)](https://hex.pm/packages/hedwig_youtube)
 [![Hex.pm](https://img.shields.io/hexpm/l/hedwig_youtube.svg)](https://hex.pm/packages/hedwig_youtube)
 [![Hex.pm](https://img.shields.io/hexpm/dt/hedwig_youtube.svg)](https://hex.pm/packages/hedwig_youtube)
 [![Build Status](https://travis-ci.org/ryanwinchester/hedwig_youtube.svg?branch=master)](https://travis-ci.org/ryanwinchester/hedwig_youtube)

## Installation

Add to the deps in `mix.exs`

```elixir
def deps do
  [
    {:hedwig_youtube, "~> 0.1.0"},
  ]
end
```

## Config

Add the responder to your `:responders` list in your bot config, `config/config.exs`

```elixir
config :my_robot, MyApp.MyRobot,
  responders: [
    {Hedwig.Responders.Youtube, []},
  ]
```

## Environment variables

- `YOUTUBE_KEY` environment variable for your **youtube API key**

Or, you can override the config, like so:

```elixir
config :hedwig_youtube,
  youtube_key: "abcdefg12345678"
```
