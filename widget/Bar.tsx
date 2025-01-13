import { Gtk, App, Astal } from "astal/gtk4"

function LauncherButton() {
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

function SettingsButton() {
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
      <LauncherButton />
    </box>
  )
}

function Center() {
  return (
    <box>
    </box>
  )
}

function End() {
  return (
    <box halign={Gtk.Align.END}>
      <SettingsButton />
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
