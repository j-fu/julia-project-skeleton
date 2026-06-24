"""
Placeholder for a short summary about {PKGNAME}.
"""
module {PKGNAME}


greet() = "Hello from  {PKGNAME}"


"""
    cliargs(kwargs...)

Create array of String to be parsed using ArgParse from keyword arguments.
Keyword arguments like `x=3` are converted to command line arguments like `--x=3`
Keyword arguments like `help=true` converted to flags like `--help`
"""
function cliargs(; kwargs...)
    return String[a.second === true ? "--$(a.first)" : "--$(a.first)=$(a.second)" for a in kwargs]
end

end # module
