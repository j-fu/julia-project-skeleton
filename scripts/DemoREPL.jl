#
# Demo script for running from  the Julia REPL
#
# Run like
#   $ julia --project
#   julia> using Revise
#   julia> includet("scripts/DemoREPL.jl")
#   julia> DemoREPL.main(dim=3)
#
# This file is organized as a module, so several different filed
# can be loaded at the same time.
module DemoREPL
using {PKGNAME}

function main(;dim=1)
    println({PKGNAME}.greet())
    println("dim=$dim")
    return nothing
end

end
