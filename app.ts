import { App } from "astal/gtk4"
import style from "./style.scss"

import Menu from "./widget/Menu"

App.start({
    css: style,
    main() {
      Menu()
    },
})
