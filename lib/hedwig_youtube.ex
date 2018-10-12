defmodule Hedwig.Responders.Youtube do
  use Hedwig.Responder
  require Logger

  @usage """
  hedwig youtube|yt|video|vid me <query> - Responds with a random video from the top 15 results
  hedwig youtube|yt|video|vid me - <query> - Responds with the first video result
  """

  respond ~r/(?:youtube|yt|video|vid)(?: me)?( -)? (.+)/i, msg do
    vids = search_vids(msg.matches[2])

    vid_id = cond do
      msg.matches[1] == " -" ->
        Enum.at(vids, 0)["id"]["videoId"]
      true ->
        Enum.random(vids)["id"]["videoId"]
    end

    send msg, "https://youtu.be/#{vid_id}"
  end

  # Search youtube for relevant videos
  @spec search_vids(String.t) :: List.t | :error
  defp search_vids(query) do
    url = "https://www.googleapis.com/youtube/v3/search"
    headers = []
    opts = [
      params: [
        key: api_key(),
        part: "id",
        type: "video",
        order: "relevance",
        maxResults: 15,
        q: query,
      ]
    ]

    case HTTPoison.get(url, headers, opts) do
      {:ok, %{status_code: 200, body: body}} ->
        res = Poison.decode! body
        res["items"]
      {_, res} ->
        Logger.warn inspect(res)
        :error
    end
  end

  def api_key, do: Config.get_env(:hedwig_youtube, :youtube_key)
end
