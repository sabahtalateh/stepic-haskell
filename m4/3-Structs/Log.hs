module Log where

import Data.Time.Clock
import Data.Time.Format
import System.Locale

timeToString :: UTCTime -> String
timeToString = formatTime defaultTimeLocale "%a %d %T"

data LogLevel = Error | Warning | Info

data LogEntry = LogEntry {timestamp :: UTCTime, logLevel :: LogLevel, message :: String}

logLevelToString :: LogLevel -> String
logLevelToString x = case x of
    Error   -> "Error"
    Warning -> "Warning"
    Info    -> "Info"


-- Йоптиль
logEntryToString :: LogEntry -> String
logEntryToString entry =
    t ++ ": " ++ l ++ ": " ++ m where
        t = timeToString        $ timestamp entry
        l = logLevelToString    $ logLevel  entry
        m = message entry

