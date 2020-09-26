echo off
curl -v -b cookie -X PUT -F "space_template[zip]=@D:\GitHub\AltspaceExample\template.zip" -F "space_template[game_engine_version]=20194" https://account.altvr.com/api/space_templates/1562517434714292382.json
