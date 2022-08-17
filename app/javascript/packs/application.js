
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap/dist/js/bootstrap.bundle"

import "../src/application.css"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
