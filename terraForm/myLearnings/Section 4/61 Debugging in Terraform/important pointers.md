Terraform has detailed logs which can be enabled by setting the TF_LOG environment variable to any value.

You can set TF_LOG to one of the log levels TRACE, DEBUG, INFO, WARN or ERROR to
change the verbosity of the logs

TRACE is the most verbose and it is the default if TF_LOG is set to something other than a log level name.
To persist logged output you can set TF_LOG_PATH in order to force the log to always be
appended to a specific file when logging is enabled
