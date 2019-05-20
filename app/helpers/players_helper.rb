module PlayersHelper

  def shareKey()
    share_key = SecureRandom.alphanumeric(6)
    shareKeyPlayers = Player.where(:share_code => share_key)
    share_key = shareKey() unless shareKeyPlayers.empty?
    return share_key
  end

end
