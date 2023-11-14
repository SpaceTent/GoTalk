package main

import (
	"fmt"

	app "github.com/SpaceTent/GoTalk/app"
	"github.com/SpaceTent/GoTalk/app/environment"
)

var GITCOMMIT = "Development Build"
var VERSION = "Development"
var BUILDTIME = "Now"

func main() {

	if VERSION == "Development" {
		fmt.Println(`
 ________     ___________      .__   __
 /  _____/  ___\__    ___/____  |  | |  | __
/   \  ___ /  _ \|    |  \__  \ |  | |  |/ /
\    \_\  (  <_> )    |   / __ \|  |_|    <
 \______  /\____/|____|  (____  /____/__|_ \
        \/                    \/          \/`)
	}

	environment.SetUpEnv(GITCOMMIT, VERSION, BUILDTIME)
	app.BootStrap(environment.GetEnvString("BIND", ":8080")).Start()
}
