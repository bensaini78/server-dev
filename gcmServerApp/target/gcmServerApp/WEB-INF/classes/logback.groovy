import ch.qos.logback.classic.encoder.PatternLayoutEncoder
import ch.qos.logback.core.ConsoleAppender
import ch.qos.logback.core.status.OnConsoleStatusListener
import ch.qos.logback.core.rolling.RollingFileAppender
import ch.qos.logback.core.rolling.TimeBasedRollingPolicy
import ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP
import static ch.qos.logback.classic.Level.INFO
 
statusListener(OnConsoleStatusListener)
 
appender("CONSOLE", ConsoleAppender) 
{
    //append=true
    encoder(PatternLayoutEncoder) 
    {
    	pattern = "%d{yyyy-MM-dd_HH:mm:ss.SSS} CVCHAT-%level: %logger{34} - %msg%n%throwable%n"
    }
}

appender("ROOT_FILE", RollingFileAppender) {
	encoder(PatternLayoutEncoder)
	{
		//pattern = "%-30(%d{yyyy-MM-dd_HH:mm:ss.SSS} [%thread]) %-5level %logger{32} - %msg%n"
		pattern = "%d{yyyy-MM-dd_HH:mm:ss.SSS} GCM-SERVER-APP-%level: %logger{34} - %msg%n%throwable%n"
	}
	file = "../logs/gcmServerApp_root.log"
	rollingPolicy(TimeBasedRollingPolicy) {
		fileNamePattern = "../logs/gcmServerApp_root.log.%d{yyyy-MM-dd-HH}.%i"
		timeBasedFileNamingAndTriggeringPolicy(SizeAndTimeBasedFNATP) {
			maxFileSize = "20MB"
		}
	}
}

appender("FILE", RollingFileAppender) {
	encoder(PatternLayoutEncoder)
	{
		//pattern = "%-30(%d{yyyy-MM-dd_HH:mm:ss.SSS} [%thread]) %-5level %logger{32} - %msg%n"
		pattern = "%d{yyyy-MM-dd_HH:mm:ss.SSS} GCM-SERVER-APP-%level: %logger{34} - %msg%n%throwable%n"
	}
	file = "../logs/gcmServerApp.log"
	rollingPolicy(TimeBasedRollingPolicy) {
		fileNamePattern = "../logs/gcmServerApp.log.%d{yyyy-MM-dd-HH}.%i"
		timeBasedFileNamingAndTriggeringPolicy(SizeAndTimeBasedFNATP) {
			maxFileSize = "20MB"
		}
	}
}

logger("com.gcm.server", INFO, ["FILE"])

root(INFO, ["ROOT_FILE","CONSOLE"])