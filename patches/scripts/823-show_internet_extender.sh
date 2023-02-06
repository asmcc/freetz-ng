[ "$FREETZ_PATCH_EXTENDER_INTERNET" == "y" ] || return 0
[ "$FREETZ_TYPE_EXTENDER" == "y" ] || return 0
echo1 "enabling internet and certificate config for wifi extender"

# patcht Internet > Freigaben

modsed \
  's/\(.*\)\(\["meshSet"\] = {.*\)/\1\["remoteHttps"\] = config\.REMOTE_HTTPS and {\n\["show"\] = true,\n\["lua"\] = "internet\/remote_https\.lua",\n\["help"\] = \(forLuaOnly and "hilfe_internet_remote_https"\) or true\n} or nil,\n\2/' \
  "${MENU_DATA_LUA}"
