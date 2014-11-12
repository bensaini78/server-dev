package com.gcm.server.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
@Order(value=2)
public class LoggingAspect {
	
	private static Logger logger = LoggerFactory.getLogger(LoggingAspect.class);

	@Pointcut("execution(* com.gcm.server.helper..*.*(..))")
	private void helpers(){};
	
	@Pointcut("execution(* com.gcm.server.dao..*.*(..))")
	private void daos(){};
	
	@Pointcut("execution(* com.gcm.server.controller..*.*(..))")
	private void controllers(){};
	
	@Pointcut("helpers() and daos()")
	private void controllersHelpersDaos(){};
	
	@Pointcut("execution(* com.gcm.server..*.*(..))")
	private void all(){};
	
	@Around("daos()")
    public Object logMethod(ProceedingJoinPoint joinPoint) throws Throwable{
        Object retVal = null;
        String methodCall  = null;

        try {
            StringBuffer startMessageStringBuffer = new StringBuffer();

            startMessageStringBuffer.append(joinPoint.getSignature().getDeclaringTypeName()).append(".");
            startMessageStringBuffer.append(joinPoint.getSignature().getName());
            startMessageStringBuffer.append("(");

            Object[] args = joinPoint.getArgs();
            for (int i = 0; i < args.length; i++) {
                startMessageStringBuffer.append(args[i]).append(",");
            }
            if (args.length > 0) {
                startMessageStringBuffer.deleteCharAt(startMessageStringBuffer.length() - 1);
            }

            startMessageStringBuffer.append(")");
            
            methodCall = startMessageStringBuffer.toString();

            logger.debug("CVCONTACTUS CALLING METHOD:{}",methodCall);

            StopWatch stopWatch = new StopWatch();
            stopWatch.start();

            retVal = joinPoint.proceed();

            stopWatch.stop();

            StringBuffer endMessageStringBuffer = new StringBuffer();
            endMessageStringBuffer.append("CVCONTACTUS FINISHED METHOD:");
            endMessageStringBuffer.append(methodCall);
            endMessageStringBuffer.append("; Return Value:");
            if(retVal !=null){
               endMessageStringBuffer.append(retVal);
            }
            endMessageStringBuffer.append("; execution time: ");
            endMessageStringBuffer.append(stopWatch.getTotalTimeMillis());
            endMessageStringBuffer.append(" ms;");
            
            logger.debug(endMessageStringBuffer.toString());
        } catch (Throwable ex) {
            StringBuffer errorMessageStringBuffer = new StringBuffer();
            errorMessageStringBuffer.append("CVCONTACTUS EXCEPTION IN METHOD:");
            errorMessageStringBuffer.append(methodCall).append(";");
            errorMessageStringBuffer.append(ex);
            logger.error(errorMessageStringBuffer.toString(), ex);
            throw ex;
        }
        return retVal;
    }
	
	@Around("helpers()")
    public Object logMethod1(ProceedingJoinPoint joinPoint) throws Throwable{
        Object retVal = null;
        String methodCall  = null;

        try {
            StringBuffer startMessageStringBuffer = new StringBuffer();

            startMessageStringBuffer.append(joinPoint.getSignature().getDeclaringTypeName()).append(".");
            startMessageStringBuffer.append(joinPoint.getSignature().getName());
            startMessageStringBuffer.append("(");

            Object[] args = joinPoint.getArgs();
            for (int i = 0; i < args.length; i++) {
                startMessageStringBuffer.append(args[i]).append(",");
            }
            if (args.length > 0) {
                startMessageStringBuffer.deleteCharAt(startMessageStringBuffer.length() - 1);
            }

            startMessageStringBuffer.append(")");
            
            methodCall = startMessageStringBuffer.toString();

            logger.debug("CVCONTACTUS CALLING METHOD:{}",methodCall);

            StopWatch stopWatch = new StopWatch();
            stopWatch.start();

            retVal = joinPoint.proceed();

            stopWatch.stop();

            StringBuffer endMessageStringBuffer = new StringBuffer();
            endMessageStringBuffer.append("CVCONTACTUS FINISHED METHOD:");
            endMessageStringBuffer.append(methodCall);
            endMessageStringBuffer.append("; Return Value:");
            if(retVal !=null){
               endMessageStringBuffer.append(retVal);
            }
            endMessageStringBuffer.append("; execution time: ");
            endMessageStringBuffer.append(stopWatch.getTotalTimeMillis());
            endMessageStringBuffer.append(" ms;");
            
            logger.debug(endMessageStringBuffer.toString());
        } catch (Throwable ex) {
            StringBuffer errorMessageStringBuffer = new StringBuffer();
            errorMessageStringBuffer.append("CVCONTACTUS EXCEPTION IN METHOD:");
            errorMessageStringBuffer.append(methodCall).append(";");
            errorMessageStringBuffer.append(ex);
            logger.error(errorMessageStringBuffer.toString(), ex);
            throw ex;
        }
        return retVal;
    }
}
