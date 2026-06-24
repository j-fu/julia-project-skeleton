#
# Command line script.
# Run as
#    julia --project scripts/demo-cli.jl
#
using {PKGNAME}

using ArgParse

function main(args)
    settings = ArgParseSettings()
    settings.description = "Demo script."
    settings.commands_are_required = false
    settings.add_version = true
    add_arg_table(
        settings,
        ["--dim"], Dict(:default => 1, :arg_type => Int, :help => "dimension")
    )
    parsed_args = parse_args(args, settings)
    dim = parsed_args["dim"]
    println({PKGNAME}.greet())
    println("dim=$dim")
    return nothing
end

main(ARGS)

