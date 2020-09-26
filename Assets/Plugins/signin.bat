echo off
title Sign In to AltspaceVR
curl -v -d "user[email]=nick@fox-gieg.com&user[password]=alteyspaceyknifeyspooney" https://account.altvr.com/users/sign_in.json -c cookie
