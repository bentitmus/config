# Navigation
tug: edit.left()
tug <number_small> times: user.left_n(number_small)
push: edit.right()
push <number_small> times: user.right_n(number_small)
north: edit.up()
north <number_small> times: user.up_n(number_small)
south: edit.down()
south <number_small> times: user.down_n(number_small)

# Insert
pour: edit.line_insert_down()
drink: edit.line_insert_up()

# Delete
scratch <number_small> times: user.delete_left_n(number_small)
drill <number_small> times: user.delete_right_n(number_small)

scratcher: user.delete_word_left_n(1)
scratcher <number_small> times: user.delete_word_left_n(number_small)

swallow: user.delete_word_right_n(1)
swallow <number_small> times: user.delete_word_right_n(number_small)

# Undo/redo
nope: edit.undo()
yes indeed: edit.redo()

# Save
disk: edit.save()
disk oliver: edit.save_all()
