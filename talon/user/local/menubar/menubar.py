from talon import Context, actions, app, registry, scope
from subprocess import run

ctx = Context()
current_mode = ""

def sketchybar(talon, tracking):
  global current_mode
  args = ["/opt/homebrew/bin/sketchybar", "--trigger", "talon_change"]
  if talon:
    args.append(f"TALON={current_mode}")
  if tracking:
    args.append("TRACKING=x")
  run(args)

@ctx.action_class("tracking")
class TrackingActions:
  def control_toggle(state = None):
    trackstate = not actions.tracking.control_enabled()
    sketchybar(actions.speech.enabled(), trackstate)
    actions.next(state)

def on_update_contexts():
  global current_mode
  modes = scope.get("mode")
  if "sleep" in modes:
    mode = "sleep"
  elif "dictation" in modes:
    if "command" in modes:
      mode = "mixed"
    else:
      mode = "dictation"
  elif "command" in modes:
    mode = "command"
  else:
    return

  if current_mode != mode:
    current_mode = mode
    sketchybar(actions.speech.enabled(), actions.tracking.control_enabled())

def on_ready():
  registry.register("update_contexts", on_update_contexts)

app.register("ready", on_ready)

