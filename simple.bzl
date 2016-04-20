def _impl(ctx):
	ctx.action(
		executable = ctx.executable._runner,
		arguments = [ctx.outputs.simple.path],
		outputs = [ctx.outputs.simple],
	)

simple = rule(
	implementation = _impl,
	attrs = {
		"_runner": attr.label(allow_files=True, executable=True, default=Label("//:simple-runner"))
	},
	outputs = {
		"simple": "%{name}.txt"
	}
)
