tug: edit.left()
tug <number_small> times: user.left_n(number_small)
push: edit.right()
push <number_small> times: user.right_n(number_small)
north: edit.up()
north <number_small> times: user.up_n(number_small)
south: edit.down()
south <number_small> times: user.down_n(number_small)

nope: edit.undo()
yes indeed: edit.redo()

disk: edit.save()
disk oliver: edit.save_all()

pour: edit.line_insert_down()
drink: edit.line_insert_up()
