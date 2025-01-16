import { Gtk, App, Astal } from "astal/gtk4"
import { Variable, bind } from "astal"

import Hyprland from "gi://AstalHyprland"
import WirePlumber from "gi://AstalWp"

function Launcher() {
  return (
    <button
      onClicked={() => {
        App.toggle_window("Menu")
      }}
    >
      <label label={"󰀻"} />
    </button>
  )
}

function Workspace({ ws }) {
  const hypr = Hyprland.get_default()
  const classes = Variable.derive(
    [bind(hypr, "focused-workspace"), bind(hypr, "clients")],
    (fws, _) => {
      const c = ["workspace", "circular"]

      if (ws.id == fws.id) {
        c.push("active")
      }

      return c
    }
  )

  return (
    <button 
      cssClasses={classes()}
      valign={Gtk.Align.CENTER}
      halign={Gtk.Align.CENTER}
      onClicked={() => ws.focus()}
    />
  )
}

function Workspaces() {
  return (
    <box 
      cssClasses={["workspaces"]}
      spacing={2}
    >
      {Array.from({ length: 3 }, (_, i) => i).map((i) => (
        <Workspace ws={Hyprland.Workspace.dummy(i + 1, null)} />
      ))}
    </box>
  )
}

function Time() {
  const time = Variable("").poll(1000, ["date", "+%H:%M"])

  return (
    <label label={time()}/>
  )
}

function Audio() {
  const audio = WirePlumber.get_default()?.audio.default_speaker

  return (
    <box 
      spacing={2}
      cssClasses={["audio"]}
    >
      <label
        cssClasses={["icon"]}
        label={
          bind(audio, "volume").as((v) => {
            if (v > 0.6) {
              return ""
            } else if (v > 0.3) {
              return ""
            } else if (v > 0) {
              return ""
            } else {
              return ""
            }
          })
      } />

      <label label={
        bind(audio, "volume").as((v) => {
          return `${Math.floor(v * 100)}%`
        })
      } />
    </box>
  )
}

function Profile() {
  return (
    <button
      onClicked={() => {
        App.toggle_window("Menu")
      }}
    >
      <label label={""} />
    </button>
  )
}

function Start() {
  return (
    <box halign={Gtk.Align.START}>
      <Launcher />
      <Gtk.Separator cssClasses={["sep"]}/>
      <Workspaces />
    </box>
  )
}

function Center() {
  return (
    <box>
      <Time />
    </box>
  )
}

function End() {
  return (
    <box halign={Gtk.Align.END}>
      <Audio />
      <Gtk.Separator cssClasses={["sep"]}/>
      <Profile />
    </box>
  )
}

export default function Bar() {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      name="Bar"
      visible
      anchor={TOP | LEFT | RIGHT}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      application={App}
      cssClasses={["bar"]}
    >
      <centerbox cssClasses={["window", "box"]} >
        <Start />
        <Center />
        <End />
      </centerbox>
    </window>
  )
}
