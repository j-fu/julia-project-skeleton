#
# Demo script for running from  the Julia REPL or from the CLI
#
# Run like
#   $ julia --project
#   julia> using Revise
#   julia> push!(LOAD_PATH, abspath("scripts"))
#   julia> using DemoREPL
#   julia> DemoREPL.main(dim=3)
#
# or like
#
#   $ julia --project scripts/DemoREPLCLI.jl
#

module DemoREPLCLI
using ArgParse
using {PKGNAME}

function cli(args)
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

main(; kwargs...) = cli({PKGNAME}.cliargs(; kwargs...))

end

#
# Check if this file is being run as the main program file.
# If yes, run the cli function.
#
abspath(PROGRAM_FILE) == @__FILE__() &&  DemoREPLCLI.cli(ARGS)
