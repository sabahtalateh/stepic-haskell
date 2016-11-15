module Log where

import Data.Time.Clock
import Data.Time.Format
import System.Locale

timeToString :: UTCTime -> String
timeToString = formatTime defaultTimeLocale "%a %d %T"

data LogLevel = Error | Warning | Info

data LogEntry = Undefined

logLevelToString :: LogLevel -> String
logLevelToString = undefined

logEntryToString :: LogEntry -> String
logEntryToString = undefined


