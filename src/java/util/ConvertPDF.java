/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.avalon.framework.logger.ConsoleLogger;
import org.apache.avalon.framework.logger.Logger;
import org.apache.fop.apps.Driver;
import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.XSLTInputHandler;
import org.xml.sax.InputSource;

/**
 *
 * @author thanhhvG
 */
public class ConvertPDF {

    public static void main(String[] args) {
        InputStream input = null;
        try {
            Driver driver = new Driver();
            Logger logger = new ConsoleLogger(ConsoleLogger.LEVEL_INFO);
            driver.setLogger(logger);
            org.apache.fop.messaging.MessageHandler.setScreenLogger(logger);
            driver.setRenderer((Driver.RENDER_PDF));
            File xslFOFile = new File("src/java/util/grammarDoc.fo");
            File pdfFile = new File("src/java/util/grammarDoc.pdf");
            input = new FileInputStream(xslFOFile);
            driver.setInputSource(new InputSource(input));
            OutputStream output = new FileOutputStream(pdfFile);
            driver.setOutputStream(output);
            driver.run();
            output.flush();
            output.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (FOPException ex) {
            ex.printStackTrace();
        } finally {
            try {
                input.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
