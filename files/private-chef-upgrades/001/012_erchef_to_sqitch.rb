define_upgrade do

  if Partybus.config.bootstrap_server

    # This command ensures Sqitch has all the metadata for changes to
    # the core schema up to version 1.0.1.  All these changes are
    # already in the schema.
    run_command("sqitch --db-user opscode-pgsql deploy --log-only --to-target @1.0.1",
                :cwd => "/opt/opscode/embedded/service/chef-server-schema")

    # There was a small change to the core schema that didn't make it
    # into the previous incarnation of the Enterprise schema; this is a
    # "real" deploy to pick up those changes.  This also removes the
    # Sequel version metadata table.
    run_command("sqitch --db-user opscode-pgsql deploy",
                :cwd => "/opt/opscode/embedded/service/chef-server-schema")

    # Finally, this loads up the change metadata for the Enterprise
    # schema.  There are no changes to it that are not already in the
    # existing schema, so it is '--log-only'.
    run_command("sqitch --db-user opscode-pgsql deploy --log-only",
                :cwd => "/opt/opscode/embedded/service/enterprise-chef-server-schema")

  end
end
