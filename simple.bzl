def _impl(ctx):
	ctx.action(
		inputs = ctx.files._my_other_runner,
		outputs = [ctx.outputs.simple],
		command = "{} > {}".format(ctx.executable._my_other_runner.path, ctx.outputs.simple.path)
	)

simple = rule(
	implementation = _impl,
	attrs = {
		"_my_other_runner": attr.label(allow_files=True, executable=True, default=Label("//:my-other-runner"))
	},
	outputs = {
		"simple": "%{name}.txt"
	}
)
