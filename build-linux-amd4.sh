#!/bin/bash

#setup the build directory
rm -r build
mkdir build

#get node
cp "$(which node)" build

#build the Database Manager and entry point to the app
go build -o medrec-amd64 main.go
cp medrec-amd64 build

#copy the ethereum client starter app
mkdir build/EthereumClient
cp GolangJSHelpers/* build/GolangJSHelpers/
cp -r GolangJSHelpers/node_modules build/GolangJSHelpers/

#build the UserClient
(cd UserClient && npm run build)
mkdir build/UserClient
cp -r UserClient/build build/UserClient
cp UserClient/electron-starter.js build/UserClient
d="UserClient/node_modules/"
mkdir -p "build/$d" && cp -r "$d/electron-prebuilt/" "build/$d/electron-prebuilt/"


tar -zcvf medrec-amd64.tar.gz build
