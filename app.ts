import { App } from "astal/gtk4"
import style from "./style.scss"

import Menu from "./widget/Menu"
import Bar from "./widget/Bar"

App.start({
    css: style,
    main() {
      Bar()
      Menu()
    },
})
