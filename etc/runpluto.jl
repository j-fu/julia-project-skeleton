using ArgParse, Pluto

function main(args)
    settings = ArgParseSettings()
    settings.description = "Start a pluto server in current directory"
    settings.commands_are_required = false
    settings.add_version = true
    add_arg_table(
        settings,
        "notebook", Dict(:help => "Notebook to run", :required => true),
        ["--no-autoreload"], Dict(:help => "Don't  run notebook with `auto_reload_from_file=true", :action => :store_true),
    )

    parsed_args = parse_args(args, settings)
    notebook = parsed_args["notebook"]

    return Pluto.run(;
        notebook,
        auto_reload_from_file = !parsed_args["no-autoreload"]
    )
end

main(ARGS)
