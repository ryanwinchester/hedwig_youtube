defmodule Hedwig.Responders.YoutubeTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "alfred", responders: [{Hedwig.Responders.Youtube, []}]

  test "responds with relevant youtube link", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "alfred yt - something"}}
    assert_receive {:message, %{text: text}}, 2000
    assert String.contains?(text, "https://youtu.be/")
  end
end
