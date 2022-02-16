import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import $ from 'jquery'
window.jQuery = $
window.$ = $

import "bootstrap"
import "../stylesheets/application"
