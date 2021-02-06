package com.amdevelopers.logger;

import java.io.File;
import java.io.IOException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.Configuration;
import org.apache.logging.log4j.core.config.Configurator;

/**
 *
 * @author Moieen Abbas
 */
public class ConsoleLogger {

    private Logger LOGGER;

    public ConsoleLogger(String str_className) {
        LOGGER = LogManager.getLogger(str_className);
    }

    public ConsoleLogger(Class c_class) {
        LOGGER = LogManager.getLogger(c_class);
    }

    public void logDebug(String str_message) {
        LOGGER.debug(str_message);
    }

    public void logInfo(String str_message) {
        LOGGER.info(str_message);
    }

    public void logError(String str_message) {
        LOGGER.error(str_message);
    }

    public void logExecption(String str_message, Exception ex) {
        LOGGER.error(str_message, ex);
    }

    public void logFatal(String str_message) {
        LOGGER.fatal(str_message);
    }

    public Logger getLogger() {
        return LOGGER;
    }

    public static void loadConfiguration(String str_path) throws IOException {
        Configurator.initialize(null, str_path.replace("/", File.separator));
    }

    public static void loadConfiguration(Configuration a_configuration) throws IOException {
        Configurator.initialize(a_configuration);
    }
}
