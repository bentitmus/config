from talon import Module, app, actions

mod = Module()

def disable():
  actions.speech.disable()

app.register("ready", disable)

@mod.action_class
class Actions:
  def sleep_all():
    """Sleeps talon and hides everything"""
    actions.user.switcher_hide_running()
    actions.user.history_disable()
    actions.user.homophones_hide()
    actions.user.help_hide()
    actions.user.mouse_sleep()
    actions.speech.disable()
